import 'package:autojidelna/src/logic/services/auth_service.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:autojidelna/src/types/freezed/user/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._authService);

  final AuthService _authService;

  User? _user;
  List<SafeAccount> _loggedSafeAccounts = [];

  User? get user => _user;
  List<SafeAccount> get loggedInAccounts => _loggedSafeAccounts;

  Future<void> login(Account account) async {
    final user = await _authService.login(account);
    if (user == null) return; // error
    _user = user;
    _loggedSafeAccounts = await _authService.getLimitedAccounts();
    notifyListeners();
  }

  Future<void> logout(SafeAccount safeAccount) async {
    if (user == null) return;
    await _authService.logout(safeAccount);
    _loggedSafeAccounts = List.from(_loggedSafeAccounts)..remove(safeAccount);
    if (_user!.accountData.username == safeAccount.username) _user = null;
    notifyListeners();
  }

  Future<void> logoutEveryone() async {
    await _authService.logoutEveryone();
    _user = null;
    _loggedSafeAccounts = [];
    notifyListeners();
  }

  Future<void> loadUser() async {
    final user = await _authService.loginFromStorage();
    if (user == null) return;
    _user = user;
    _loggedSafeAccounts = await _authService.getLimitedAccounts();
    notifyListeners();
  }

  Future<void> changeUser(SafeAccount safeAccount) async {
    if (_user == null) return;
    await _authService.changeAccount(safeAccount);
    notifyListeners();
  }

  Future<void> updateUserData() async {
    if (_user == null) return;
    _user = _user!.copyWith(data: await _authService.fetchUserData(_user!.accountData.username));
    notifyListeners();
  }
}
