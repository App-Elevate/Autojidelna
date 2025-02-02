// Všechny objekty a enumy, které se používají v aplikaci
// TODO: převést na freezed
import 'dart:async';

import 'package:canteenlib/canteenlib.dart';

/// Třída pro kešování dat Canteeny
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

/// Popisuje všechny možné stavy jídla
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

enum TypStatistiky {
  /// normální objednávky
  objednavka,

  /// automatické objednávky
  auto,

  /// objednávky chycené burzaCatherem
  burzaCatcher
}
