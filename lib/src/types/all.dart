/// Popisuje všechny možné stavy jídla
enum StavJidla {
  /// Je objednano a lze odebrat
  objednano,

  /// Je objednano a lze pouze dát na burzu
  objednanoPouzeNaBurzu,

  /// Bylo objednano a pravděpodobně snězeno ;)
  objednanoVyprsenaPlatnost,

  /// Nabízíme jídlo na burze
  vlozenoNaBurze,

  /// Jídlo nemáme objednané, ale je dostupné na burze
  dostupneNaBurze,

  /// Jídlo nemáme objednané, ale můžeme stále ještě normálně objednat
  neobjednano,

  /// Jídlo nemáme objednané a není dostupné na burze, vypršela platnost nebo nemá uživatel dostatečný kredit
  nedostupne
}
