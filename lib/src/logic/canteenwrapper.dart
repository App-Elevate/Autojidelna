// Hlavní soubor ve kterém Jsou indexovány obědy a zároveň je zde vytvořena instance canteenu

// completer
import 'dart:async';

// json encoding and decoding
import 'dart:convert';
import 'dart:math';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/_conf/secure_storage.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/logic/notifications.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:canteenlib/canteenlib.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:http/http.dart' as http;
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
  Completer<Canteen>? _loginCompleter;

  Completer<void> _indexingCompleter = Completer<void>();

  CanteenData? _canteenData;
  Canteen? _canteenInstance;

  /// Can throw ConnectionErrors
  Future<Canteen> get canteenInstance async {
    if (_canteenInstance != null && _canteenInstance!.prihlasen) {
      return _canteenInstance!;
    }
    try {
      await loginFromStorage();
    } catch (e) {
      return Future.error(e);
    }
    return _canteenInstance!;
  }

  /// Can throw ConnectionErrors
  Future<CanteenData> get canteenData async {
    if (_canteenData != null && _canteenInstance!.prihlasen) {
      return _canteenData!;
    }
    try {
      await loginFromStorage();
    } catch (e) {
      return Future.error(e);
    }
    return _canteenData!;
  }

  /// this should be safe to get since we are always logged in and the data is created with the login.
  /// DO NOT CALL BEFORE LOGGIN IN
  Uzivatel? get uzivatel => _canteenData?.uzivatel;

  CanteenData? get canteenDataUnsafe => _canteenData;

  ///přidá +1 pro counter statistiky a pokud je zapnutý analytics tak ji pošle do firebase
  void pridatStatistiku(TypStatistiky statistika) async {
    Box box = Hive.box(Boxes.statistics);
    switch (statistika) {
      //default case
      case TypStatistiky.objednavka:
        int pocetStatistiky = box.get(HiveKeys.statistikaObjednavka, defaultValue: 0);
        pocetStatistiky++;
        if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: 'objednavka', parameters: {'pocet': pocetStatistiky});

        box.put(HiveKeys.statistikaObjednavka, pocetStatistiky);
        break;
      case TypStatistiky.auto:
        int pocetStatistiky = box.get(HiveKeys.statistikaAuto, defaultValue: 0);
        pocetStatistiky++;
        box.put(HiveKeys.statistikaAuto, pocetStatistiky);
        break;
      case TypStatistiky.burzaCatcher:
        int pocetStatistiky = box.get(HiveKeys.statistikaBurzaCatcher, defaultValue: 0);
        pocetStatistiky++;
        box.put(HiveKeys.statistikaBurzaCatcher, pocetStatistiky);
        break;
    }
  }

  Future<dynamic> runWithSafety(Future f) async {
    try {
      return await f;
    } catch (e) {
      handleError(e);
      return Future.error(e);
    }
  }

  void handleError(dynamic e) {
    //TODO: add error handling
    /*
    if (e == ConnectionErrors.badLogin) {
      Future.delayed(Duration.zero, () => failedLoginDialog(MyApp.navigatorKey.currentState!.context, lang.errorsBadLogin));
    } else if (e == ConnectionErrors.wrongUrl) {
      Future.delayed(Duration.zero, () => failedLoginDialog(MyApp.navigatorKey.currentState!.context, lang.errorsBadUrl));
    } else if (e == ConnectionErrors.noInternet) {
      Future.delayed(Duration.zero, () => failedLoginDialog(MyApp.navigatorKey.currentState!.context, lang.errorsNoInternet));
    } else if (e == ConnectionErrors.connectionFailed) {
      Future.delayed(Duration.zero, () => failedLoginDialog(MyApp.navigatorKey.currentState!.context, lang.errorsBadConnection));
    }*/
  }

  /// logs you in if you are already logged in or gets the already existing instance
  /// We don't have to do much of error handling here because we already know that the user has been logged in.
  /// If there is an error it's probably because of the internet connection or change of password. The popup is the best solution.
  Future<int> loginFromStorage() async {
    try {
      LoggedAccounts loginData = await getLoginDataFromSecureStorage();
      if (loginData.currentlyLoggedInId != null) {
        _canteenInstance = await _login(
          loginData.users[loginData.currentlyLoggedInId!].url,
          loginData.users[loginData.currentlyLoggedInId!].username,
          loginData.users[loginData.currentlyLoggedInId!].password,
          safetyId: (_canteenData?.id ?? 0) + 1,
        );
        return loginData.currentlyLoggedInId!;
      } else {
        return Future.error(ConnectionErrors.noLogin);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Returns a [Canteen] instance with a logged in user.
  ///
  /// Main logic about logging in is in this function
  ///
  /// Has to be called before using [canteenInstance].
  ///
  /// If [url], [username] or [password] is null, it will try to get it from storage.
  /// If user is logging in all [url], [username] and [password] has to be provided.
  /// If user has already logged in nothing has to be provided
  /// Can throw errors:
  ///
  /// [ConnectionErrors.noLogin] - user is not logged in (no username and password in secure storage)
  ///
  /// [ConnectionErrors.badLogin] - user has entered the wrong password/username
  ///
  /// [ConnectionErrors.wrongUrl] - user has entered the wrong url
  ///
  /// [ConnectionErrors.connectionFailed] - connection to the canteen server failed
  ///
  /// [ConnectionErrors.noInternet] - user is not connected to the internet
  Future<Canteen> _login(String url, String username, String password, {int? safetyId, bool indexLunches = true}) async {
    if (_loginCompleter == null || _loginCompleter!.isCompleted) {
      _loginCompleter = Completer<Canteen>();
    } else {
      return _loginCompleter!.future;
    }
    _canteenInstance = Canteen(url);
    try {
      if (!await _canteenInstance!.login(username, password)) {
        _loginCompleter!.completeError(ConnectionErrors.badLogin);
        return Future.error(ConnectionErrors.badLogin);
      }
    } catch (e) {
      try {
        await _canteenInstance!.login(username, password); //second try's the charm
      } catch (e) {
        bool connected = await InternetConnectionChecker().hasConnection;
        _loginCompleter!.completeError(ConnectionErrors.noInternet);
        if (!connected) return Future.error(ConnectionErrors.noInternet);
        try {
          await http.get(Uri.parse(url));
        } catch (e) {
          return Future.error(ConnectionErrors.wrongUrl);
        }
        _loginCompleter!.completeError(ConnectionErrors.connectionFailed);
        return Future.error(ConnectionErrors.connectionFailed);
      }
    }
    try {
      checked = {};
      _currentlyLoading = {};
      _canteenData = CanteenData(
        id: (safetyId ?? 0) + 1,
        pocetJidel: {},
        username: username,
        url: url,
        uzivatel: _canteenInstance!.missingFeatures.contains(Features.ziskatUzivatele)
            ? Uzivatel(uzivatelskeJmeno: username)
            : await _canteenInstance!.ziskejUzivatele(),
        jidlaNaBurze: _canteenInstance!.missingFeatures.contains(Features.burza) ? const [] : await _canteenInstance!.ziskatBurzu(),
        currentlyLoading: {},
        jidelnicky: {},
        vydejny: (await _canteenInstance!.jidelnicekDen()).vydejny,
      );
    } catch (e) {
      _loginCompleter!.completeError(ConnectionErrors.connectionFailed);
      return Future.error(ConnectionErrors.connectionFailed);
    }
    if (indexLunches) {
      int vydejna = (Hive.box(Boxes.appState).get(HiveKeys.location(username, url), defaultValue: 0)) + 1;
      (await canteenInstance).vydejna = vydejna;
      await _indexLunchesMonth();
      smartPreIndexing(DateTime.now());
    }
    _loginCompleter!.complete(_canteenInstance!);
    return canteenInstance;
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
      await loginFromStorage();
      return _ziskatJidelnicekDen(den, tries: tries + 1);
    }
  }

  /// this function should be called globally hovewer you need to be logged in or have credentials in the storage.
  /// can throw errors if there is no internet connection or if there is no user logged in and if there are no credentials in storage.
  /// in both cases it throws 'no internet'
  Future<Jidelnicek> getLunchesForDay(DateTime date, {bool? requireNew}) async {
    date = DateTime(date.year, date.month, date.day);
    if ((_canteenData == null || _canteenInstance == null || !_canteenInstance!.prihlasen)) {
      try {
        await loginFromStorage();
      } catch (e) {
        return Future.error(e);
      }
    }
    int id = _canteenData!.id;
    requireNew ??= false;

    if (_canteenData!.jidelnicky.containsKey(DateTime(date.year, date.month, date.day)) && !requireNew) {
      return _canteenData!.jidelnicky[DateTime(date.year, date.month, date.day)]!;
    }
    if (_canteenData!.currentlyLoading[date] != null) {
      return _canteenData!.currentlyLoading[date]!.future;
    }
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(ConnectionErrors.connectionFailed);
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

  // just switches the account - YOU NEED TO CALL [loginFromStorage] AFTER THIS
  Future<void> switchAccount(int id) async {
    LoggedAccounts loginData = await getLoginDataFromSecureStorage();
    loginData.currentlyLoggedInId = id;
    await saveLoginToSecureStorage(loginData);
  }

  // switches the account and logs in as the new account
  Future<bool> changeAccount(int id, {bool indexLunches = false, bool saveToStorage = true}) async {
    LoggedAccounts loginData = await getLoginDataFromSecureStorage();
    String url = loginData.users[id].url;
    String username = loginData.users[id].username;
    String password = loginData.users[id].password;
    loginData.currentlyLoggedInId = id;
    if (saveToStorage) {
      saveLoginToSecureStorage(loginData);
    }
    try {
      _canteenInstance = await _login(url, username, password, safetyId: (_canteenData?.id ?? 0) + 1, indexLunches: indexLunches);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addAccount(String url, String username, String password) async {
    try {
      await _login(url, username, password, safetyId: (_canteenData?.id ?? 0) + 1);
      LoggedAccounts loginData = await getLoginDataFromSecureStorage();
      loginData.users.add(Account(username: username, password: password, url: url));
      loginData.currentlyLoggedInId = loginData.users.length - 1;
      saveLoginToSecureStorage(loginData);
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// save data to secure storage used for storing username and password
  Future<void> saveStringToSecureStorage(String key, String value) async {
    await App.secureStorage.write(key: key, value: value);
  }

  /// saves the loginData class to secure storage
  Future<void> saveLoginToSecureStorage(LoggedAccounts loginData) async {
    await saveStringToSecureStorage(SecureStorage.loginData, jsonEncode(loginData));
    initAwesome();
  }

  /// gets an instance of loginData.

  /// get data from secure storage
  /// can return null if there is no data
  Future<String?> getDataFromSecureStorage(String key) async {
    try {
      String? value = await App.secureStorage.read(key: key);
      return value;
    } catch (e) {
      return null;
    }
  }

  ///logs out a user with [id].
  ///if [id] is null it will log out currently logged in user
  Future<void> logout({int? id}) async {
    id ??= (await getLoginDataFromSecureStorage()).currentlyLoggedInId;
    if (id == null) {
      return logoutEveryone();
    }
    if (analyticsEnabledGlobally && analytics != null) {
      analytics!.logEvent(name: 'logout');
    }
    LoggedAccounts loginData = await getLoginDataFromSecureStorage();
    bool isDuplicate = false;
    for (int i = 0; i < loginData.users.length; i++) {
      if (loginData.users[i].username == loginData.users[id].username && i != id) {
        isDuplicate = true;
        break;
      }
    }
    if (!isDuplicate) {
      AwesomeNotifications().removeChannel(NotificationIds.dnesniJidloChannel(loginData.users[id].username, loginData.users[id].url));
      AwesomeNotifications().removeChannel(NotificationIds.objednanoChannel(loginData.users[id].username, loginData.users[id].url));
      AwesomeNotifications().removeChannel(NotificationIds.kreditChannel(loginData.users[id].username, loginData.users[id].url));
    }
    //removing just the one item from the array

    //ensuring correct loginData.currentlyloggedInId
    if (id == loginData.currentlyLoggedInId) {
      loginData.currentlyLoggedInId = loginData.users.length - 2;
    } else if (loginData.currentlyLoggedInId != null && loginData.currentlyLoggedInId! > id) {
      loginData.currentlyLoggedInId = loginData.currentlyLoggedInId! - 1;
    }

    loginData.users.removeAt(id);
    // if it's empty make sure to throw user on login screen
    if (loginData.users.isEmpty) {
      loginData.currentlyLoggedInId = null;
    }
    await saveLoginToSecureStorage(loginData);
    if (loginData.currentlyLoggedInId == null) {
      await logoutEveryone();
    }
    return;
  }

  ///logs out everyone
  Future<void> logoutEveryone() async {
    LoggedAccounts loginData = await getLoginDataFromSecureStorage();
    loginData.currentlyLoggedInId = null;
    loginData.users.clear();
    for (int id = 0; id < loginData.users.length; id++) {
      AwesomeNotifications().removeChannel(NotificationIds.objednanoChannel(loginData.users[id].username, loginData.users[id].url));
      AwesomeNotifications().removeChannel(NotificationIds.kreditChannel(loginData.users[id].username, loginData.users[id].url));
    }
    //even though I don't like this it is safe because this is called rarely
    _canteenInstance = null;
    _canteenData = null;
    saveLoginToSecureStorage(loginData);
    return;
  }

  Future<LoggedAccounts> getLoginDataFromSecureStorage() async {
    try {
      String? value = await getDataFromSecureStorage(SecureStorage.loginData);
      if (value == null || value.trim().isEmpty) {
        return LoggedAccounts();
      }
      return LoggedAccounts.fromJson(jsonDecode(value));
    } catch (e) {
      return LoggedAccounts();
    }
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
  Future<void> quickOrder(String username) async {
    if (_canteenInstance?.prihlasen != true) {
      if (!await loginAsUsername(username)) return;
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

  Future<bool> loginAsUsername(String username, {bool saveToStorage = false}) async {
    LoggedAccounts loginData = await getLoginDataFromSecureStorage();
    for (Account uzivatel in loginData.users) {
      try {
        if (uzivatel.username == username) {
          await _login(uzivatel.url, uzivatel.username, uzivatel.password, safetyId: (_canteenData?.id ?? 0) + 1, indexLunches: false);
          return true;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}
