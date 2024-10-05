import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  int? _loggedInID;
  Uzivatel? _uzivatel;
  List<String> _usernames = [];

  int? get loggedInID => _loggedInID;
  Uzivatel? get uzivatel => _uzivatel;
  List<String> get usernames => _usernames;

  void setLoggedInID(int? id) {
    _loggedInID = id;
    notifyListeners();
  }

  void setUzivatel(Uzivatel uzivatel) {
    _uzivatel = uzivatel;
    notifyListeners();
  }

  void addUsername(String username) {
    _usernames = List.from([..._usernames, username]);
    notifyListeners();
  }
}
