// Hlavní soubor ve kterém Jsou indexovány obědy a zároveň je zde vytvořena instance canteenu

// completer
import 'dart:async';

// json encoding and decoding
import 'dart:math';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/canteen_data/canteen_data.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:autojidelna/src/types/freezed/user/user.dart';

import 'package:canteenlib/canteenlib.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

//TODO: add functionality for analytics
bool analyticsEnabledGlobally = false;
FirebaseAnalytics? analytics;

/// variable that sets how many max lunches are expected. The higher the worse performance but less missing lunches. This is a fix for the api sometimes not sending all the lunches
const int numberOfMaxLunches = 3;
// třída pro funkcionalitu celé aplikace
LoggedInCanteen loggedInCanteen = LoggedInCanteen();

class LoggedInCanteen {
  LoggedInCanteen();
  Map<DateTime, Completer<Jidelnicek>> _currentlyLoading = {};
  Map<DateTime, bool> checked = {};
  Completer<void>? _loginCompleter;

  Completer<void> _indexingCompleter = Completer<void>();

  CanteenData? _canteenData;
  Canteen? _canteenInstance;

  Future<Canteen> get canteenInstance async {
    if (_canteenInstance != null && _canteenInstance!.prihlasen) {
      return _canteenInstance!;
    }
    return _canteenInstance!;
  }

  Future<CanteenData> get canteenData async {
    if (_canteenData != null && _canteenInstance!.prihlasen) {
      return _canteenData!;
    }
    return _canteenData!;
  }

  /// this should be safe to get since we are always logged in and the data is created with the login.
  /// DO NOT CALL BEFORE LOGGIN IN
  Uzivatel? get uzivatel => _canteenData?.uzivatel;

  /// Main logic about logging in is in this function
  ///
  /// Has to be called before using [canteenInstance].
  ///
  /// Can throw errors:
  ///
  /// [AuthErrors.connectionFailed] - connection to the canteen server failed
  Future<void> login(User user, {int? safetyId, bool indexLunches = true}) async {
    if (_loginCompleter == null || _loginCompleter!.isCompleted) {
      _loginCompleter = Completer();
    } else {
      return _loginCompleter!.future;
    }
    _canteenInstance = App.getIt<Canteen>();

    try {
      checked = {};
      _currentlyLoading = {};
      _canteenData = CanteenData(
        id: (safetyId ?? 0) + 1,
        pocetJidel: {},
        url: user.accountData.username,
        uzivatel:
            _canteenInstance!.missingFeatures.contains(Features.ziskatUzivatele) ? Uzivatel(uzivatelskeJmeno: user.accountData.username) : user.data,
        jidlaNaBurze: _canteenInstance!.missingFeatures.contains(Features.burza) ? const [] : await _canteenInstance!.ziskatBurzu(),
        currentlyLoading: {},
        jidelnicky: {},
        vydejny: (await _canteenInstance!.jidelnicekDen()).vydejny,
      );
    } catch (e) {
      _loginCompleter!.completeError(AuthErrors.connectionFailed);
      return Future.error(AuthErrors.connectionFailed);
    }
    if (indexLunches) {
      int vydejna = (Hive.box(Boxes.appState).get(HiveKeys.location(user.accountData), defaultValue: 0)) + 1;
      (await canteenInstance).vydejna = vydejna;
      await _indexLunchesMonth();
      smartPreIndexing(DateTime.now());
    }
    _loginCompleter!.complete();
  }

  Future<void> _indexLunchesMonth() async {
    try {
      if (_canteenInstance!.missingFeatures.contains(Features.jidelnicekMesic)) return;
      List<Jidelnicek> jidelnicky = await (await canteenInstance).jidelnicekMesic();
      for (Jidelnicek jidelnicek in jidelnicky) {
        _canteenData!.jidelnicky[jidelnicek.den] = jidelnicek;
        _canteenData!.pocetJidel[jidelnicek.den] = jidelnicek.jidla.length;
      }
    } catch (e) {
      //indexing can be done later
    }
  }

  void zmenitVydejnu(int vydejna) async {
    (await canteenInstance).vydejna = vydejna;
    _canteenData!.id++;
    _canteenData!.jidelnicky.clear();
    _canteenData!.pocetJidel.clear();
    await _indexLunchesMonth();
    smartPreIndexing(DateTime.now());
  }

  /// získá Jídelníček pro den [den]
  /// tuto funkci nevolat globálně, nebere informace z canteenData a zároveň je neukládá
  /// uživatel musí být přihlášen
  /// Jinak vyhodí chybu 'Nejdříve se musíte přihlásit'
  /// může vyhodit chybu 'no internet'
  Future<Jidelnicek> _ziskatJidelnicekDen(DateTime den, {int? tries}) async {
    if (_currentlyLoading.containsKey(den) && (tries == 0 || tries == null)) {
      return _currentlyLoading[den]!.future;
    }
    _currentlyLoading[den] ??= Completer<Jidelnicek>();
    tries ??= 0;
    try {
      Jidelnicek jidelnicek = await (await canteenInstance).jidelnicekDen(den: den);
      if (tries >= 2) {
        try {
          _currentlyLoading[den]!.complete(jidelnicek);
        } catch (e) {
          //nothing
        }
        Future.delayed(const Duration(seconds: 1), () => _currentlyLoading.remove(den));
        return jidelnicek;
      }
      //addition to fix api sometimes giving us less lunches that it should. This is a second layer for the fix
      if (_canteenData!.pocetJidel[DateTime(den.year, den.month, den.day)] != null &&
          _canteenData!.pocetJidel[DateTime(den.year, den.month, den.day)]! > jidelnicek.jidla.length) {
        return _ziskatJidelnicekDen(den, tries: tries + 1);
      }
      try {
        _currentlyLoading[den]!.complete(jidelnicek);
      } catch (e) {
        //nothing
      }
      Future.delayed(const Duration(seconds: 1), () => _currentlyLoading.remove(den));
      return jidelnicek;
    } catch (e) {
      if (_currentlyLoading[den] != null) {
        _currentlyLoading[den]!.completeError(e);
        _currentlyLoading.remove(den);
      }
      if (e == CanteenLibExceptions.jePotrebaSePrihlasit) {
        return _ziskatJidelnicekDen(den, tries: tries + 1);
      } else if (analyticsEnabledGlobally && analytics != null) {
        FirebaseCrashlytics.instance.log(e.toString());
      }
      return _ziskatJidelnicekDen(den, tries: tries + 1);
    }
  }

  /// this function should be called globally hovewer you need to be logged in or have credentials in the storage.
  /// can throw errors if there is no internet connection or if there is no user logged in and if there are no credentials in storage.
  /// in both cases it throws 'no internet'
  Future<Jidelnicek> getLunchesForDay(DateTime date, {bool? requireNew}) async {
    date = DateTime(date.year, date.month, date.day);

    int id = 1;
    requireNew ??= false;

    if (_canteenData!.jidelnicky.containsKey(DateTime(date.year, date.month, date.day)) && !requireNew) {
      return _canteenData!.jidelnicky[DateTime(date.year, date.month, date.day)]!;
    }
    if (_canteenData!.currentlyLoading[date] != null) {
      return _canteenData!.currentlyLoading[date]!.future;
    }
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(AuthErrors.noInternetConnection);
    }
    Jidelnicek jidelnicek = await _ziskatJidelnicekDen(date);

    //saving to cache
    if (_canteenData != null && _canteenData!.id == id) {
      _canteenData!.jidelnicky[DateTime(date.year, date.month, date.day)] = jidelnicek;

      _canteenData!.pocetJidel[DateTime(date.year, date.month, date.day)] = jidelnicek.jidla.length;
    }
    return jidelnicek;
  }

  Future<void> smartPreIndexing(DateTime dateToBeJumpedTo) async {
    preIndexLunchesRange(dateToBeJumpedTo, 3)
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.subtract(const Duration(days: 2)), 2))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 3)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 6)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 9)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.subtract(const Duration(days: 5)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 12)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 15)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 18)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.add(const Duration(days: 21)), 3))
        .then((_) async => preIndexLunchesRange(dateToBeJumpedTo.subtract(const Duration(days: 8)), 3));
  }

  Future<void> preIndexLunchesRange(DateTime start, int howManyDays) async {
    _indexingCompleter = Completer();
    for (int i = 0; i < howManyDays; i++) {
      preIndexLunches(start.add(Duration(days: i)));
    }
    await _indexingCompleter.future;
  }

  Future<void> preIndexLunches(DateTime date) async {
    await getLunchesForDay(date);
    try {
      if (_canteenData!.currentlyLoading.isEmpty) {
        _indexingCompleter.complete();
      }
    } catch (e) {
      return;
    }
    return;
  }

  ///Kontroluje jestli je jídlo na burze a vrátí true/false
  bool jeJidloNaBurze(Jidlo jidlo) {
    try {
      String varianta = jidlo.varianta;
      DateTime den = jidlo.den;
      for (var jidloNaBurze in _canteenData!.jidlaNaBurze) {
        if (jidloNaBurze.den == den && jidloNaBurze.varianta == varianta) {
          return true;
        }
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  /// don't call from main thread
  /// objedná první jídlo v každém dni, pokud už v tom dni nemáme objednáno.
  Future<void> quickOrder(SafeAccount safeAccount) async {
    if (_canteenInstance?.prihlasen != true) {
      if (await AuthService().loginBySafeAccount(safeAccount) == null) return;
    }
    await _indexLunchesMonth();
    for (int i = 0; i < 10; i++) {
      bool mameObjednano = false;
      Jidelnicek jidelnicek = await getLunchesForDay(DateTime.now().add(Duration(days: i)));
      for (Jidlo jidlo in jidelnicek.jidla) {
        if (jidlo.objednano) {
          mameObjednano = true;
          break;
        }
      }
      if (!mameObjednano && jidelnicek.jidla.isNotEmpty) {
        jidelnicek = await getLunchesForDay(DateTime.now().add(Duration(days: i)), requireNew: true);
        await _canteenInstance!.objednat(jidelnicek.jidla[Random().nextInt(jidelnicek.jidla.length)]);
      }
    }
    return;
  }
}
