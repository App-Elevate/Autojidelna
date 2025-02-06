import 'package:autojidelna/src/_conf/dates.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

class DishesOfTheDay with ChangeNotifier {
  Map<int, Jidelnicek> _menus = {}; // Store menus by day index
  Map<int, int> _numberOfDishes = {};
  int _dayIndex = DateTime.now().difference(Dates.minimalDate).inDays; // Store day index separately if needed

  Map<int, Jidelnicek> get allMenus => _menus;

  Map<int, int> get allNumberOfDishes => _numberOfDishes;

  Jidelnicek? getMenu(int dayIndex) => _menus[dayIndex];

  int? getNumberOfDishes(int dayIndex) => _numberOfDishes[dayIndex];

  int get dayIndex => _dayIndex;

  void reset() {
    _menus = {};
    _numberOfDishes = {};
  }

  void resetMenu() {
    _menus = {};
  }

  void setMenu(int dayIndex, Jidelnicek menu) {
    if (_menus[dayIndex] == menu) return;
    _menus.update(dayIndex, (_) => menu, ifAbsent: () => menu);
    _menus = Map.from(_menus);
    notifyListeners();
  }

  void setNumberOfDishes(int dayIndex, int numberOfDishes) {
    if (_numberOfDishes[dayIndex] == numberOfDishes) return;
    _numberOfDishes.update(dayIndex, (_) => numberOfDishes, ifAbsent: () => numberOfDishes);
    _numberOfDishes = Map.from(_numberOfDishes);
    notifyListeners();
  }

  void setDayIndex(int dayIndex) {
    if (_dayIndex == dayIndex) return;
    _dayIndex = dayIndex;
    notifyListeners();
  }
}
