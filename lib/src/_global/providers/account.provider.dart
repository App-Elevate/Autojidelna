import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  String? _url;
  int? _loggedInID;
  Uzivatel _uzivatel = Uzivatel();
  List<String> _usernames = [];
  Map<int, String> _locations = {};

  String? get url => _url;
  int? get loggedInID => _loggedInID;
  Uzivatel get uzivatel => _uzivatel;
  List<String> get usernames => _usernames;
  Map<int, String> get locations => _locations;

  void setUrl(String url) {
    _url = url;
    notifyListeners();
  }

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

  void setLocations(Map<int, String> locations) {
    _locations = Map.from(locations);
    notifyListeners();
  }
}
