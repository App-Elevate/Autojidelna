import 'package:flutter/material.dart';

class DatePickerProvider extends ChangeNotifier {
  DateTime _appFocusedDate = DateTime.now();
  DateTime _userFocusedDate = DateTime.now();
  int _visibleMonth = DateTime.now().month;

  /// Used by the app for UI changes, isn't highlighted
  DateTime get appFocusedDate => _appFocusedDate;

  /// This is the date that the user actually selects
  DateTime get userFocusedDate => _userFocusedDate;

  /// This is used to hide arrows
  int get visibleMonth => _visibleMonth;

  set appFocusedDate(DateTime focusedDate) {
    if (_appFocusedDate == focusedDate) return;
    _appFocusedDate = focusedDate;
    notifyListeners();
  }

  set userFocusedDate(DateTime fakeFocusedDate) {
    if (_userFocusedDate == fakeFocusedDate) return;
    _userFocusedDate = fakeFocusedDate;
    notifyListeners();
  }

  set visibleMonth(int visibleMonth) {
    if (_visibleMonth == visibleMonth) return;
    _visibleMonth = visibleMonth;
    notifyListeners();
  }
}
