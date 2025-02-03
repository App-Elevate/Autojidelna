import 'dart:convert';

import 'package:autojidelna/src/_conf/analytics.dart';
import 'package:autojidelna/src/_conf/secure_storage.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/init_app.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/notification_service.dart';
import 'package:autojidelna/src/logic/notifications.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/types/freezed/logged_accounts/logged_accounts.dart';
import 'package:autojidelna/src/types/freezed/user/user.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;

class AuthService {
  Future<User?> login(Account account) async {
    List<Account> duplicates = await _checkForDuplicates(account);
    InitApp().registerCanteen(account.url);

    User? user;

    Canteen instance = App.getIt<Canteen>();

    try {
      // First login attempt
      if (!await instance.login(account.username, account.password)) {
        return Future.error(AuthErrors.wrongCredentials);
      }
    } catch (_) {
      // Second login attempt in case of failure
      try {
        await instance.login(account.username, account.password);
      } catch (_) {
        // Check for internet connectivity
        if (!await InternetConnectionChecker().hasConnection) {
          return Future.error(AuthErrors.noInternetConnection);
        }

        // Check if the URL is valid by making a request
        try {
          await http.get(Uri.parse(account.url));
        } catch (_) {
          return Future.error(AuthErrors.wrongUrl);
        }

        return Future.error(AuthErrors.connectionFailed);
      }
    }

    if (duplicates.isEmpty) await _saveAccountToStorage(account);
    await loggedInCanteen.login(account.url, account.username, account.password); // TODO:temporary

    try {
      user = User(
        username: account.username,
        canteenUrl: account.url,
        canteenLocations: (await instance.jidelnicekDen()).vydejny,
        data: instance.missingFeatures.contains(Features.ziskatUzivatele)
            ? Uzivatel(uzivatelskeJmeno: account.username)
            : await instance.ziskejUzivatele(),
      );
    } catch (e) {
      rethrow;
    }

    return user;
  }

  /// Checks for duplicates in logged accounts, compares [Account.url] and [Account.username]
  Future<List<Account>> _checkForDuplicates(Account account) async {
    List<Account> duplicates = [];
    LoggedAccounts loginData = await _getDataFromStorage();
    for (Account loggedAccount in loginData.accounts) {
      if (loggedAccount.username == account.username && loggedAccount.url == account.url) duplicates.add(loggedAccount);
    }
    return duplicates;
  }

  Future<User?> loginByUsername(String username) async {
    Account? account = await _findByUsername(username);
    throwIf(account == null, AuthErrors.accountNotFound);

    return login(account!);
  }

  Future<bool> logout(String username) async {
    Account? account = await _findByUsername(username);
    throwIf(account == null, AuthErrors.accountNotFound);

    await _removeAccountFromStorage(account!);
    NotificationService().removeNotifications(account);

    // TODO: move to analytics service or something
    if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: AnalyticsNames.logout);

    return true;
  }

  Future<void> logoutEveryone() async {
    LoggedAccounts loginData = await _getDataFromStorage();

    for (var account in loginData.accounts) {
      await _removeAccountFromStorage(account);
      NotificationService().removeNotifications(account);
    }

    // TODO: move to analytics service or something
    if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: AnalyticsNames.logoutEveryone);
  }

  Future<Account?> _findByUsername(String username) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    for (Account account in loginData.accounts) {
      if (account.username == username) return account;
    }
    return null;
  }

  Future<void> _saveDataToStorage(LoggedAccounts loginData) async {
    print(jsonEncode(loginData.toJson()));
    await App.secureStorage.write(key: SecureStorage.loginData, value: jsonEncode(loginData.toJson()));
    // TODO
    initAwesome();
  }

  Future<LoggedAccounts> _getDataFromStorage() async {
    String? value = await App.secureStorage.read(key: SecureStorage.loginData);
    if (value == null || value.trim().isEmpty) return LoggedAccounts();
    print(jsonEncode(jsonDecode(value)));
    return LoggedAccounts.fromJson(jsonDecode(value));
  }

  Future<List<String>> getLoggedUsernames() async {
    return (await _getDataFromStorage()).accounts.map((a) => a.username).toList();
  }

  Future<void> _saveAccountToStorage(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(
      loggedInUsername: account.username,
      accounts: [...loginData.accounts, account],
    );
    await _saveDataToStorage(updatedData);
  }

  /// Removes a logged account from storage, returns true if current user has been removed
  Future<bool> _removeAccountFromStorage(Account account) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(
      loggedInUsername: account.username == loginData.loggedInUsername ? null : loginData.loggedInUsername,
      accounts: List.from(loginData.accounts)..remove(account),
    );
    await _saveDataToStorage(updatedData);
    return updatedData.loggedInUsername == null;
  }

  Future<void> removeAccount(String username) async {
    final Account? account = await _findByUsername(username);
    throwIf(account == null, AuthErrors.accountNotFound);

    await _removeAccountFromStorage(account!);
  }

  Future<User?> loginFromStorage() async {
    final LoggedAccounts loginData = await _getDataFromStorage();

    throwIf(
      loginData.loggedInUsername == null,
      AuthErrors.accountNotFound,
    ); // TODO: throw error, show a list of other logged accounts, else login screen
    return await loginByUsername(loginData.loggedInUsername!);
  }

  Future<void> changeAccount(String username) async {
    LoggedAccounts loginData = await _getDataFromStorage();
    LoggedAccounts updatedData = LoggedAccounts(accounts: loginData.accounts, loggedInUsername: username);
    await _saveDataToStorage(updatedData);

    Account? account = await _findByUsername(username);
    throwIf(account == null, AuthErrors.accountNotFound);
  }
}

enum AuthErrors {
  failedLogin,
  wrongCredentials,
  missingCredentials,
  accountNotFound,
  noInternetConnection,
  connectionFailed,
  wrongUrl,
}
