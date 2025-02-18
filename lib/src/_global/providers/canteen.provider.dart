import 'dart:async';

import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/services/canteen_service.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CanteenProvider with ChangeNotifier {
  CanteenProvider(this._canteenService);

  final CanteenService _canteenService;

  bool _ordering = false;

  /// Store menus by day index
  Map<DateTime, Jidelnicek> _menus = {};

  /// Stores number of dishes per day index
  Map<DateTime, int> _numberOfDishes = {};

  List<Burza> _dishMarketplace = [];

  /// DayIndex
  DateTime _selectedDate = DateTime.now().normalize;

  int _locationId = 1;

  Future<void> getMenu(DateTime date) async {
    if (!App.getIt<Canteen>().missingFeatures.contains(Features.jidelnicekMesic)) {
      if (await getMonthlyMenu()) {
        notifyListeners();
      }
    }

    Jidelnicek? menu = await _canteenService.getDailyMenu(date.normalize);
    if (menu == null) return;
    _menus[date] = menu;
    notifyListeners();
  }

  Future<bool> getMonthlyMenu() async {
    List<Jidelnicek>? menuList = await _canteenService.getMonthlyMenu();
    if (menuList == null || menuList.isEmpty) return false;
    for (Jidelnicek m in menuList) {
      _menus[m.den.normalize] = m;
    }
    return true;
  }

  Jidelnicek? getCachedMenu(DateTime selectedDate) => _menus[selectedDate.normalize];

  DateTime get selectedDate => _selectedDate.normalize;
  bool get ordering => _ordering;
  int get locationId => _locationId;

  Future<void> preIndexMenus({DateTime? targetDate}) async {
    // If monthly menu fetching is available, use it
    if (!App.getIt<Canteen>().missingFeatures.contains(Features.jidelnicekMesic)) {
      await getMonthlyMenu();
      notifyListeners();
      return;
    }

    // Otherwise, use smart pre-indexing around the target date
    targetDate ??= DateTime.now();
    await _smartPreIndexing(targetDate.normalize);
  }

  Future<void> _smartPreIndexing(DateTime targetDate) async {
    await _preIndexLunchesRange(targetDate, 3);
    await _preIndexLunchesRange(targetDate.subtract(const Duration(days: 2)), 2);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 3)), 3);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 6)), 3);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 9)), 3);
    await _preIndexLunchesRange(targetDate.subtract(const Duration(days: 5)), 3);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 12)), 3);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 15)), 3);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 18)), 3);
    await _preIndexLunchesRange(targetDate.add(const Duration(days: 21)), 3);
    await _preIndexLunchesRange(targetDate.subtract(const Duration(days: 8)), 3);
  }

  Future<void> _preIndexLunchesRange(DateTime start, int howManyDays) async {
    for (int i = 0; i < howManyDays; i++) {
      DateTime date = start.add(Duration(days: i)).normalize;
      if (!_menus.containsKey(date)) {
        Jidelnicek? menu = await _canteenService.getDailyMenu(date);
        if (menu != null) {
          _menus[date] = menu;
          notifyListeners();
        }
      }
    }
  }

  void updateMenu(Jidelnicek menu) {
    Jidelnicek tempMenu = _menus[menu.den.normalize]!;
    setMenu(menu, notify: false);
    setNumberOfDishes(tempMenu, notify: false);
    notifyListeners();
  }

  void setMenu(Jidelnicek menu, {bool notify = true}) {
    DateTime tempDate = menu.den.normalize;
    if (_menus[tempDate] == menu) return;
    _menus.update(tempDate, (_) => menu, ifAbsent: () => menu);
    _menus = Map.from(_menus);
    if (notify) notifyListeners();
  }

  void setNumberOfDishes(Jidelnicek menu, {bool notify = true}) {
    DateTime temp = menu.den.normalize;
    int numberOfDishes = menu.jidla.length;
    if (_numberOfDishes[temp] == numberOfDishes) return;
    _numberOfDishes.update(temp, (_) => numberOfDishes, ifAbsent: () => numberOfDishes);
    _numberOfDishes = Map.from(_numberOfDishes);
    if (notify) notifyListeners();
  }

  void setSelectedDate(DateTime selectedDate) async {
    if (_selectedDate == selectedDate.normalize) return;
    _selectedDate = selectedDate.normalize;
    if (await InternetConnectionChecker().hasConnection) preIndexMenus(targetDate: selectedDate);
    notifyListeners();
  }

  void changeLocation(int id) {
    _canteenService.changeLocation(id);
    _locationId = id;
    _menus = Map.from({});
    _numberOfDishes = Map.from({});
    notifyListeners();
  }

  void setDayIndex(int dayIndex) => setSelectedDate(convertIndexToDatetime(dayIndex));

  set ordering(bool ordering) {
    if (_ordering == ordering) return;
    _ordering = ordering;
    notifyListeners();
  }

  /// Checks if a dish is on the market
  bool dishOnMarketplace(Jidlo dish) {
    for (Burza jidloNaBurze in _dishMarketplace) {
      if (jidloNaBurze.den == dish.den && jidloNaBurze.varianta == dish.varianta) return true;
    }

    return false;
  }

  /// Gets correct [Burza] dish for given [Jidlo] dish.
  /// Should be called after [dishOnMarketplace].
  Burza? getMarketplaceTypeDish(Jidlo dish) {
    for (Burza marketplaceDish in _dishMarketplace) {
      if (marketplaceDish.den == dish.den && marketplaceDish.varianta == dish.varianta) return marketplaceDish;
    }
    return null;
  }

  Future<void> refreshCurrentPage() async => getMenu(selectedDate.normalize);
}
