import 'package:flutter/foundation.dart';

class Ordering with ChangeNotifier {
  bool _ordering = false;

  bool get ordering => _ordering;

  set ordering(bool ordering) {
    if (_ordering == ordering) return;
    _ordering = ordering;
    notifyListeners();
  }
}
