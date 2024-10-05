// Všechny objekty a enumy, které se používají v aplikaci
// TODO: převést na freezed
import 'dart:async';

import 'package:canteenlib/canteenlib.dart';

enum ConnectionErrors {
  /// user is not logged in (no username and password in secure storage)
  noLogin,

  /// user has entered the wrong password/username
  badLogin,

  /// user has entered the wrong url
  wrongUrl,

  /// connection to the canteen server failed
  connectionFailed,

  /// user is not connected to the internet
  noInternet,
}

//classy pro přihlašování

///samotný uživatel
class Account {
  String username;
  String password;
  String url;

  Account({
    required this.username,
    required this.password,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'url': url,
      };

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        username: json['username'],
        password: json['password'],
        url: json['url'],
      );
}

/// Všichni přihlášení uživatelé
class LoggedAccounts {
  int? currentlyLoggedInId;
  List<Account> users = [];

  LoggedAccounts({
    this.currentlyLoggedInId,
    this.users = const [],
  });

  Map<String, dynamic> toJson() => {
        'currentlyLoggedInId': currentlyLoggedInId,
        'users': users.map((e) => e.toJson()).toList(),
      };

  factory LoggedAccounts.fromJson(Map<String, dynamic> json) => LoggedAccounts(
        currentlyLoggedInId: json['currentlyLoggedInId'],
        users: (json['users'] as List).map((e) => Account.fromJson(e)).toList(),
      );
}

/// Omezená data pro zobrazení ve výběru účtů
class LoggedAccountsLimited {
  List<String> usernames;
  int? loggedInID;

  LoggedAccountsLimited({required this.usernames, required this.loggedInID});
}

///informace o nejnovější verzi aplikace (podpora jen pro android)
class ReleaseInfo {
  ReleaseInfo({
    required this.isAndroid,
    this.latestVersion,
    this.downloadUrl,
    this.changelog,
    this.appStoreUrl,
    this.isOnAppstore,
    this.googlePlayUrl,
    this.isOnGooglePlay,
    required this.currentlyLatestVersion,
  });
  String? latestVersion;
  String? downloadUrl;
  String? changelog;
  bool? isOnAppstore;
  bool? isOnGooglePlay;
  String? googlePlayUrl;
  String? appStoreUrl;
  bool currentlyLatestVersion;
  bool isAndroid;
}

///Třída pro kešování dat Canteeny
class CanteenData {
  /// id, aby se nám neindexovaly špatně jídelníčky
  int id;

  /// login uživatele
  String username;

  /// url kantýny
  String url;

  /// info o uživateli - např kredit,jméno,příjmení...
  Uzivatel uzivatel;

  /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
  Map<DateTime, Jidelnicek> jidelnicky;

  /// fix pro api vracející méně jídel než by mělo
  Map<DateTime, int> pocetJidel;

  /// seznam jídel, které jsou na burze
  List<Burza> jidlaNaBurze;

  /// jídelníčky, které aktuálně načítáme
  Map<DateTime, Completer<Jidelnicek>> currentlyLoading;

  Map<int, String>? vydejny;

  CanteenData({
    required this.username,
    required this.url,
    required this.uzivatel,
    required this.jidlaNaBurze,
    this.id = 0,
    required this.currentlyLoading,
    required this.jidelnicky,
    required this.pocetJidel,
    this.vydejny,
  });
  CanteenData copyWith() {
    return CanteenData(
      username: username,
      url: url,
      uzivatel: uzivatel,
      jidlaNaBurze: jidlaNaBurze,
      currentlyLoading: currentlyLoading,
      jidelnicky: jidelnicky,
      pocetJidel: pocetJidel,
      vydejny: vydejny,
    );
  }
}

///class pro general access o stavu snackbaru
class SnackBarShown {
  bool shown = false;

  SnackBarShown({required this.shown});
}

///Popisuje všechny možné stavy jídla
enum StavJidla {
  /// je objednano a lze odebrat
  objednano,

  /// je objednano a lze pouze dát na burzu
  objednanoNelzeOdebrat,

  /// bylo objednano a pravděpodobně snězeno ;)
  objednanoVyprsenaPlatnost,

  /// nabízíme jídlo na burze
  naBurze,

  /// jídlo nemáme objednané, ale je dostupné na burze
  dostupneNaBurze,

  /// jídlo nemáme objednané, ale můžeme stále ještě normálně objednat
  neobjednano,

  /// jídlo nemáme objednané a není dostupné na burze, vypršela platnost nebo nemá uživatel dostatečný kredit
  nedostupne
}

///Popisuje možnosti kdy se login nepovedl
enum LoginFormErrorField {
  ///heslo nebo uživatelské jméno je neplatné
  password,

  ///url je neplatná
  url,
}

enum TypStatistiky {
  ///normální objednávky
  objednavka,

  ///automatické objednávky
  auto,

  ///objednávky chycené burzaCatherem
  burzaCatcher
}

/// Describes what time format will be used by the app
enum DateFormatOptions {
  dMy,
  mmddyy,
  ddmmyy,
  yyyymmdd,
  ddmmmyyyy,
  mmmddyyyy,
}

/// Class containing all fonts used by the apps
class Fonts {
  static const String body = 'Inter';
  static const String headings = 'Lexend';
}
