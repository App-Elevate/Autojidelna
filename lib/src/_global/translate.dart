import 'package:flutter/material.dart';

class Translate extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void translate(String locale) {
    _currentLocale = Locale(locale);
    notifyListeners();
  }
}
