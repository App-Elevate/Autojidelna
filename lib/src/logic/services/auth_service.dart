import 'dart:convert';

import 'package:autojidelna/src/_conf/analytics.dart';
import 'package:autojidelna/src/_conf/secure_storage.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/init_app.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/services/notification_service.dart';
import 'package:autojidelna/src/logic/url.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/types/freezed/logged_accounts/logged_accounts.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:autojidelna/src/types/freezed/user/user.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;

class AuthService {
  /// Main logic for loging in.
  /// Can throw:
  ///
  /// [AuthErrors.connectionFailed] - Connection to the canteen server failed
  ///
  /// [AuthErrors.noInternetConnection] - The user doesn't have an internet connection
  ///
  /// [AuthErrors.wrongCredentials] - The user has entered incorrect credentials
  ///
  /// [AuthErrors.wrongUrl] - The user has entered an invalid URL
  Future<User?> login(Account account) async {
    String url = Url.clean(account.url);
    User? user;

    InitApp().registerCanteen(url);
    Canteen instance = App.getIt<Canteen>();

    try {
      // First login attempt (with cleaned URL)
      if (!await instance.login(account.username, account.password)) {
        return Future.error(AuthErrors.wrongCredentials);
      }
    } catch (_) {
      // Second login attempt
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

    if (!await _hasDuplicates(account)) {
      await _saveAccountToStorage(account);
      await NotificationService().initAwesome();
    }

    try {
      user = User(
        accountData: SafeAccount.fromAccount(account),
        canteenLocations: (await instance.jidelnicekDen()).vydejny,
        data: await fetchUserData(account.username),
      );
    } catch (e) {
      rethrow;
    }
    return user;
  }

  /// Logs in by provided [safeAccount]
  /// Can throw:
  ///
  /// [AuthErrors.accountNotFound] - A matching [Account] was not found
  Future<User?> loginBySafeAccount(SafeAccount safeAccount) async {
    Account? account = await _findBySafeAccount(safeAccount);
    throwIf(account == null, AuthErrors.accountNotFound);

    return login(account!);
  }

  /// Logs in using data saved in Secure storage
  ///
  /// Can throw:
  ///
  /// [AuthErrors.accountNotFound] - A matching [Account] was not found
  ///
  /// [AuthErrors.missingCredentials] - Secure storage doesn't contain any credentials
  Future<User?> loginFromStorage() async {
    final LoggedAccounts loginData = await _getDataFromStorage();

    throwIf(loginData.accounts.isEmpty, AuthErrors.missingCredentials);
    throwIf(loginData.loggedInAccount == null, AuthErrors.accountNotSelected);
    return await loginBySafeAccount(loginData.loggedInAccount!);
  }

  Future<List<SafeAccount>> getLimitedAccounts() async {
    return (await _getDataFromStorage()).accounts.map(SafeAccount.fromAccount).toList();
  }

  /// Changes [LoggedAccounts.loggedInAccount] to the provided [saveAccount]
  ///
  /// [AuthService.loginFromStorage] NEEDS TO BE CALLED AFTER THIS
  Future<void> changeAccount(SafeAccount saveAccount) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    throwIf(!loginData.accounts.any((account) => SafeAccount.fromAccount(account) == saveAccount), AuthErrors.accountNotFound);
    LoggedAccounts updatedData = LoggedAccounts(accounts: loginData.accounts, loggedInAccount: saveAccount);
    await _saveDataToStorage(updatedData);
  }

  Future<Uzivatel> fetchUserData(String username) async {
    Canteen instance = App.getIt<Canteen>();
    return instance.missingFeatures.contains(Features.ziskatUzivatele) ? Uzivatel(uzivatelskeJmeno: username) : await instance.ziskejUzivatele();
  }

  /// Logs out a specific user
  ///
  /// Can throw:
  ///
  /// [AuthErrors.accountNotFound] - A matching [Account] was not found
  Future<void> logout(SafeAccount safeAccount) async {
    Account? account = await _findBySafeAccount(safeAccount);
    throwIf(account == null, AuthErrors.accountNotFound);

    await _removeAccountFromStorage(account!);
    NotificationService().removeNotifications(SafeAccount.fromAccount(account));

    // TODO: move to analytics service or something
    if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: AnalyticsNames.logout);
  }

  // Logs out every logged in user
  Future<void> logoutEveryone() async {
    LoggedAccounts loginData = await _getDataFromStorage();

    for (Account account in loginData.accounts) {
      NotificationService().removeNotifications(SafeAccount.fromAccount(account));
    }

    await _saveDataToStorage(LoggedAccounts());

    // TODO: move to analytics service or something
    if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: AnalyticsNames.logoutEveryone);
  }

  /// Checks for duplicates in logged accounts.
  ///
  /// Compares [Account.url] and [Account.username]
  Future<bool> _hasDuplicates(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    for (Account loggedAccount in loginData.accounts) {
      if (loggedAccount.isSame(account)) return true;
    }
    return false;
  }

  /// Finds user in [LoggedAccounts], returns null if a matching account isn't found.
  Future<Account?> _findBySafeAccount(SafeAccount safeAccount) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    for (Account account in loginData.accounts) {
      if (safeAccount.matches(account)) return account;
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
  }

  /// Saves an [Account] to Secure storage.
  Future<void> _saveAccountToStorage(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(
      loggedInAccount: SafeAccount.fromAccount(account),
      accounts: [...loginData.accounts, account],
    );
    await _saveDataToStorage(updatedData);
  }

  /// Removes an [Account] from Secure storage.
  Future<void> _removeAccountFromStorage(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(
      loggedInAccount: loginData.loggedInAccount!.matches(account) ? null : loginData.loggedInAccount,
      accounts: List.from(loginData.accounts)..remove(account),
    );
    await _saveDataToStorage(updatedData);
  }
}
