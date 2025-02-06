import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/types/freezed/user/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._authService);

  final AuthService _authService;

  User? _user;
  List<String> _usernames = [];

  User? get user => _user;
  List<String> get usernames => _usernames;

  Future<void> login(Account account) async {
    final user = await _authService.login(account);
    if (user == null) return; // error
    _user = user;
    _usernames = (await _authService.getLimitedAccounts()).map((a) => a.username).toList();
    notifyListeners();
  }

  Future<void> logout(String username) async {
    if (user == null) return;
    await _authService.logout(_user!.username);
    _usernames = List.from(_usernames)..remove(_user!.username);
    if (_user!.username == username) _user = null;
    notifyListeners();
  }

  Future<void> logoutEveryone() async {
    await _authService.logoutEveryone();
    _user = null;
    _usernames = [];
    notifyListeners();
  }

  Future<void> loadUser() async {
    final user = await _authService.loginFromStorage();
    if (user == null) return;
    _user = user;
    _usernames = (await _authService.getLimitedAccounts()).map((a) => a.username).toList();
    notifyListeners();
  }

  Future<void> changeUser(String username) async {
    if (_user == null) return;
    await _authService.changeAccount(username);
    notifyListeners();
  }
}
