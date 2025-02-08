import 'dart:async';

import 'package:canteenlib/canteenlib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'canteen_data.freezed.dart';

/// Třída pro kešování dat Canteeny
@unfreezed
class CanteenData with _$CanteenData {
  factory CanteenData({
    /// id, aby se nám neindexovaly špatně jídelníčky
    @Default(0) int id,

    /// url kantýny
    required String url,

    /// info o uživateli - např kredit,jméno,příjmení...
    required Uzivatel uzivatel,

    /// seznam jídel, které jsou na burze
    required List<Burza> jidlaNaBurze,

    /// jídelníčky, které aktuálně načítáme
    required Map<DateTime, Completer<Jidelnicek>> currentlyLoading,

    /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
    required Map<DateTime, Jidelnicek> jidelnicky,

    /// fix pro api vracející méně jídel než by mělo
    required Map<DateTime, int> pocetJidel,
    Map<int, String>? vydejny,
  }) = _CanteenData;
}
