import 'dart:convert';

import 'package:autojidelna/src/_conf/analytics.dart';
import 'package:autojidelna/src/_conf/secure_storage.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/init_app.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/notification_service.dart';
import 'package:autojidelna/src/logic/notifications.dart';
import 'package:autojidelna/src/logic/url.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/types/freezed/logged_accounts/logged_accounts.dart';
import 'package:autojidelna/src/types/freezed/user/user.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;

class AuthService {
  /// Main logic for loging in.
  /// Can throw errors:
  ///
  /// [AuthErrors.wrongCredentials] - The user has entered incorrect credentials
  ///
  /// [AuthErrors.wrongUrl] - The user has entered an invalid URL
  ///
  /// [AuthErrors.noInternetConnection] - The user doesn't have an internet connection
  ///
  /// [AuthErrors.connectionFailed] - connection to the canteen server failed
  ///
  Future<User?> login(Account account) async {
    List<Account> duplicates = await _checkForDuplicates(account);
    String url = Url.clean(account.url);
    User? user;

    InitApp().registerCanteen(url);
    Canteen instance = App.getIt<Canteen>();

    try {
      // First login attempt
      if (!await instance.login(account.username, account.password)) {
        return Future.error(AuthErrors.wrongCredentials);
      }
    } catch (_) {
      // Second login attempt (with cleaned URL)
      url = account.url;
      InitApp().registerCanteen(url);
      instance = App.getIt<Canteen>();

      try {
        if (!await instance.login(account.username, account.password)) {
          return Future.error(AuthErrors.wrongCredentials);
        }
      } catch (_) {
        // Check for internet connectivity
        if (!await InternetConnectionChecker().hasConnection) {
          return Future.error(AuthErrors.noInternetConnection);
        }

        // Check if the URL is valid by making a request
        try {
          await http.get(Uri.parse(url));
        } catch (_) {
          return Future.error(AuthErrors.wrongUrl);
        }

        return Future.error(AuthErrors.connectionFailed);
      }
    }

    if (duplicates.isEmpty) await _saveAccountToStorage(account);

    try {
      user = User(
        username: account.username,
        canteenUrl: url,
        canteenLocations: (await instance.jidelnicekDen()).vydejny,
        data: instance.missingFeatures.contains(Features.ziskatUzivatele)
            ? Uzivatel(uzivatelskeJmeno: account.username)
            : await instance.ziskejUzivatele(),
      );
    } catch (e) {
      rethrow;
    }

    await loggedInCanteen.login(user); // TODO:temporary

    return user;
  }

  /// Logs in by provided [username]
  /// /// Can throw:
  ///
  /// [AuthErrors.accountNotFound] if a matching [Account] is not found
  Future<User?> loginByUsername(String username) async {
    Account? account = await _findByUsername(username);
    throwIf(account == null, AuthErrors.accountNotFound);

    return login(account!);
  }

  /// Logs in using data saved in Secure storage
  ///
  /// Can throw:
  ///
  /// [AuthErrors.accountNotFound] if a matching [Account] is not found
  ///
  ///[AuthErrors.missingCredentials] if a there aren't any credentials saved in Secure storage
  Future<User?> loginFromStorage() async {
    final LoggedAccounts loginData = await _getDataFromStorage();

    throwIf(loginData.accounts.isEmpty, AuthErrors.missingCredentials);
    throwIf(loginData.loggedInUsername == null && loginData.accounts.isNotEmpty, AuthErrors.accountNotFound);
    return await loginByUsername(loginData.loggedInUsername!);
  }

  /// Returns a list of logged in accounts stripped of their passwords
  Future<List<Account>> getLimitedAccounts() async {
    return (await _getDataFromStorage()).accounts.map((account) => account.copyWith(password: '')).toList();
  }

  /// Changes [LoggedAccounts.loggedInUsername] to the provided [username]
  ///
  /// [AuthService.loginFromStorage] NEEDS TO BE CALLED AFTER THIS
  Future<void> changeAccount(String username) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    throwIf(!loginData.accounts.any((account) => account.username == username), AuthErrors.accountNotFound);
    LoggedAccounts updatedData = LoggedAccounts(accounts: loginData.accounts, loggedInUsername: username);
    await _saveDataToStorage(updatedData);
  }

  /// Logs out a specific user
  ///
  /// Can throw [AuthErrors.accountNotFound] if a matching [Account] is not found
  Future<void> logout(String username) async {
    Account? account = await _findByUsername(username);
    throwIf(account == null, AuthErrors.accountNotFound);

    await _removeAccountFromStorage(account!);
    NotificationService().removeNotifications(account);

    // TODO: move to analytics service or something
    if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: AnalyticsNames.logout);
  }

  // Logs out every logged in user
  Future<void> logoutEveryone() async {
    LoggedAccounts loginData = await _getDataFromStorage();

    for (var account in loginData.accounts) {
      NotificationService().removeNotifications(account);
    }

    await _saveDataToStorage(LoggedAccounts());

    // TODO: move to analytics service or something
    if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: AnalyticsNames.logoutEveryone);
  }

  /// Checks for duplicates in logged accounts.
  ///
  /// Compares [Account.url] and [Account.username]
  Future<List<Account>> _checkForDuplicates(Account account) async {
    List<Account> duplicates = [];
    LoggedAccounts loginData = await _getDataFromStorage();
    for (Account loggedAccount in loginData.accounts) {
      if (loggedAccount.username == account.username && Url.isSame(account.url, loggedAccount.url)) duplicates.add(loggedAccount);
    }
    return duplicates;
  }

  /// Finds user in [LoggedAccounts], returns null if a matching account isn't found.
  Future<Account?> _findByUsername(String username) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    for (Account account in loginData.accounts) {
      if (account.username == username) return account;
    }
    return null;
  }

  /// Reads [LoggedAccounts] from Secure storage.
  Future<LoggedAccounts> _getDataFromStorage() async {
    String? value = await App.secureStorage.read(key: SecureStorage.loginData);
    if (value == null || value.trim().isEmpty) return LoggedAccounts();
    return LoggedAccounts.fromJson(jsonDecode(value));
  }

  /// Saves [LoggedAccounts] to Secure storage.
  Future<void> _saveDataToStorage(LoggedAccounts loginData) async {
    await App.secureStorage.write(key: SecureStorage.loginData, value: jsonEncode(loginData.toJson()));
    // TODO : move somewhere else
    initAwesome();
  }

  /// Saves an [Account] to Secure storage.
  Future<void> _saveAccountToStorage(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(
      loggedInUsername: account.username,
      accounts: [...loginData.accounts, account],
    );
    await _saveDataToStorage(updatedData);
  }

  /// Removes an [Account] from Secure storage.
  Future<void> _removeAccountFromStorage(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(
      loggedInUsername: account.username == loginData.loggedInUsername ? null : loginData.loggedInUsername,
      accounts: List.from(loginData.accounts)..remove(account),
    );
    await _saveDataToStorage(updatedData);
  }
}
