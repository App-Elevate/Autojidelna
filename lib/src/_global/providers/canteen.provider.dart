import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

class CanteenProvider with ChangeNotifier {
  bool _ordering = false;

  /// Store menus by day index
  Map<DateTime, Jidelnicek> _menus = {};

  /// Stores number of dishes per day index
  Map<DateTime, int> _numberOfDishes = {};

  /// DayIndex
  DateTime _selectedDate = DateTime.now().normalize;

  Jidelnicek? getMenu(DateTime selectedDate) => _menus[selectedDate.normalize];
  DateTime get selectedDate => _selectedDate.normalize;
  bool get ordering => _ordering;

  int branch = 1;

  void setMenu(DateTime date, Jidelnicek menu) {
    DateTime temp = date.normalize;
    if (_menus[temp] == menu) return;
    _menus.update(temp, (_) => menu, ifAbsent: () => menu);
    _menus = Map.from(_menus);
    notifyListeners();
  }

  void setNumberOfDishes(DateTime date, int numberOfDishes) {
    DateTime temp = date.normalize;
    if (_numberOfDishes[temp] == numberOfDishes) return;
    _numberOfDishes.update(temp, (_) => numberOfDishes, ifAbsent: () => numberOfDishes);
    _numberOfDishes = Map.from(_numberOfDishes);
    notifyListeners();
  }

  void setSelectedDate(DateTime selectedDate) {
    if (_selectedDate == selectedDate.normalize) return;
    _selectedDate = selectedDate.normalize;
    notifyListeners();
  }

  void setDayIndex(int dayIndex) => setSelectedDate(convertIndexToDatetime(dayIndex));

  set ordering(bool ordering) {
    if (_ordering == ordering) return;
    _ordering = ordering;
    notifyListeners();
  }
}
