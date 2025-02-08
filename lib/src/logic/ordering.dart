import 'dart:async';

import 'package:autojidelna/src/_conf/errors.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
import 'package:autojidelna/src/logic/statistics_service.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late final Canteen _canteen;

void pressed(BuildContext context, Jidlo dish, StavJidla stavJidla) async {
  final lang = context.l10n;
  final prov = context.read<CanteenProvider>();
  Uzivatel uzivatel = context.read<UserProvider>().user!.data;

  DateTime day = dish.den;
  int dayIndex = convertDateTimeToIndex(day);
  int dishIndex = prov.getMenu(dayIndex)!.jidla.indexOf(dish);

  void updateJidelnicek(Jidelnicek jidelnicek) {
    Jidelnicek menu = prov.getMenu(dayIndex)!;
    prov.setMenu(dayIndex, jidelnicek);
    prov.setNumberOfDishes(dayIndex, menu.jidla.length);
  }

  if (prov.ordering) return;

  prov.ordering = true;
  try {
    _canteen = App.getIt<Canteen>();
  } catch (e) {
    showErrorSnackBar(SnackBarOrderingErrors.dishOrdering(lang));
    return;
  }

  Jidlo jidloSafe;
  try {
    jidloSafe = (await loggedInCanteen.getLunchesForDay(day, requireNew: true)).jidla[dishIndex];
  } catch (e) {
    showErrorSnackBar(SnackBarOrderingErrors.dishOrdering(lang));
    if (context.mounted) prov.ordering = false;

    return;
  }

  switch (stavJidla) {
    case StavJidla.neobjednano:
      {
        try {
          Jidelnicek jidelnicek = await _canteen.objednat(jidloSafe);
          if (jidelnicek.jidla[dishIndex].objednano == false) {
            jidelnicek = await loggedInCanteen.getLunchesForDay(day, requireNew: true);
            jidelnicek = await _canteen.objednat(jidelnicek.jidla[dishIndex]);
          }
          updateJidelnicek(jidelnicek);
          StatisticsService().addStatistic(StatisticType.order);
        } catch (e) {
          showErrorSnackBar(SnackBarOrderingErrors.dishOrdering(lang));
        }
      }
      break;
    case StavJidla.dostupneNaBurze:
      {
        try {
          String varianta = jidloSafe.varianta;
          DateTime den = jidloSafe.den;
          bool nalezenoJidloNaBurze = false;
          for (var jidloNaBurze in (await loggedInCanteen.canteenData).jidlaNaBurze) {
            if (jidloNaBurze.den == den && jidloNaBurze.varianta == varianta) {
              try {
                // first try
                Jidelnicek jidelnicek = await _canteen.objednatZBurzy(jidloNaBurze);
                if (jidelnicek.jidla[dishIndex].objednano == false) {
                  List<Burza> burza = await _canteen.ziskatBurzu();
                  for (var jidloNaBurze in burza) {
                    if (jidloNaBurze.den == den && jidloNaBurze.varianta == varianta) {
                      // second try
                      jidelnicek = await _canteen.objednatZBurzy(jidloNaBurze);
                    }
                  }
                }
                updateJidelnicek(jidelnicek);
                StatisticsService().addStatistic(StatisticType.order);
              } catch (e) {
                showErrorSnackBar(SnackBarOrderingErrors.dishOrdering(lang));
              }
            }
          }
          if (nalezenoJidloNaBurze == false) {
            showErrorSnackBar(SnackBarOrderingErrors.dishNotInMarketplace(lang));
          }
        } catch (e) {
          showErrorSnackBar(SnackBarOrderingErrors.dishOrdering(lang));
        }
      }
      break;
    case StavJidla.objednanoVyprsenaPlatnost:
      {
        showErrorSnackBar(SnackBarOrderingErrors.dishCancellationExpired(lang));
      }
      break;
    case StavJidla.objednanoNelzeOdebrat:
      {
        try {
          Jidelnicek jidelnicek = await _canteen.doBurzy(jidloSafe);
          if (jidelnicek.jidla[dishIndex].naBurze == false) {
            jidelnicek = await loggedInCanteen.getLunchesForDay(day, requireNew: true);
            jidelnicek = await _canteen.doBurzy(jidelnicek.jidla[dishIndex]);
          }
          updateJidelnicek(jidelnicek);
        } catch (e) {
          showErrorSnackBar(SnackBarOrderingErrors.dishOrdering(lang));
        }
      }
      break;
    case StavJidla.nedostupne:
      {
        if (day.isBefore(DateTime.now())) {
          showErrorSnackBar(SnackBarOrderingErrors.dishCannotBeOrdered(lang));
          break;
        }
        try {
          if (uzivatel.kredit < jidloSafe.cena!) {
            showErrorSnackBar(SnackBarOrderingErrors.insufficientCredit(lang));
            break;
          }
        } catch (e) {
          //pokud se nepodaří načíst kredit, tak to necháme být
        }
        showErrorSnackBar(SnackBarOrderingErrors.dishCannotBeOrdered(lang));
      }
      break;
    case StavJidla.objednano:
      {
        try {
          Jidelnicek jidelnicek = await _canteen.objednat(jidloSafe);
          if (jidelnicek.jidla[dishIndex].objednano == true) {
            jidelnicek = await loggedInCanteen.getLunchesForDay(day, requireNew: true);
            jidelnicek = await _canteen.objednat(jidelnicek.jidla[dishIndex]);
          }
          updateJidelnicek(jidelnicek);
        } catch (e) {
          showErrorSnackBar(SnackBarOrderingErrors.cancelingOrder(lang));
        }
      }
      break;
    case StavJidla.naBurze:
      {
        try {
          Jidelnicek jidelnicek = await _canteen.doBurzy(jidloSafe);
          if (jidelnicek.jidla[dishIndex].naBurze == true) {
            jidelnicek = await loggedInCanteen.getLunchesForDay(day, requireNew: true);
            jidelnicek = await _canteen.doBurzy(jidelnicek.jidla[dishIndex]);
          }
          updateJidelnicek(jidelnicek);
        } catch (e) {
          showErrorSnackBar(SnackBarOrderingErrors.addingToMarketplace(lang));
        }
      }
      break;
  }
  if (context.mounted) prov.ordering = false;
}

void cannotBeOrderedFix(BuildContext context, int dayIndex) async {
  final lang = context.l10n;
  await Future.delayed(const Duration(milliseconds: 200));
  try {
    if (!convertIndexToDatetime(dayIndex).isBefore(DateTime.now()) && context.mounted) {
      final CanteenProvider dishesOfTheDay = context.read<CanteenProvider>();
      Jidelnicek jidelnicekCheck = await loggedInCanteen.getLunchesForDay(convertIndexToDatetime(dayIndex), requireNew: true);

      for (int i = 0; i < jidelnicekCheck.jidla.length; i++) {
        if (dishesOfTheDay.getMenu(dayIndex)!.jidla[i].lzeObjednat != jidelnicekCheck.jidla[i].lzeObjednat) {
          dishesOfTheDay.setMenu(dayIndex, jidelnicekCheck);
          return;
        }
      }
    }
  } catch (e) {
    showErrorSnackBar(SnackBarAuthErrors.connectionFailed(lang));
  }
}

StavJidla getStavJidla(Jidlo dish) {
  if (dish.naBurze) {
    //pokud je od nás vloženo na burze, tak není potřeba kontrolovat nic jiného
    return StavJidla.naBurze;
  } else if (dish.objednano && dish.lzeObjednat) {
    return StavJidla.objednano;
  } else if (dish.objednano && !dish.lzeObjednat && (dish.burzaUrl == null || dish.burzaUrl!.isEmpty)) {
    //pokud nelze dát na burzu, tak už je po platnosti (nic už s tím neuděláme)
    return StavJidla.objednanoVyprsenaPlatnost;
  } else if (dish.objednano && !dish.lzeObjednat) {
    return StavJidla.objednanoNelzeOdebrat;
  } else if (!dish.objednano && dish.lzeObjednat) {
    return StavJidla.neobjednano;
  } else if (loggedInCanteen.jeJidloNaBurze(dish)) {
    return StavJidla.dostupneNaBurze;
  }
  return StavJidla.nedostupne;
}

bool isButtonEnabled(StavJidla stavJidla) {
  switch (stavJidla) {
    case StavJidla.dostupneNaBurze:
    case StavJidla.naBurze:
    case StavJidla.neobjednano:
    case StavJidla.objednano:
    case StavJidla.objednanoNelzeOdebrat:
      return true;
    default:
      return false;
  }
}

String getObedText(BuildContext context, Jidlo dish, StavJidla stavJidla) {
  final lang = context.l10n;
  int dayIndex = convertDateTimeToIndex(dish.den);
  Jidelnicek menu = context.select<CanteenProvider, Jidelnicek>((data) => data.getMenu(dayIndex)!);
  DateTime day = convertIndexToDatetime(dayIndex);
  switch (stavJidla) {
    case StavJidla.objednano:
      return lang.cancel;
    case StavJidla.neobjednano:
      return lang.objednat;
    case StavJidla.objednanoVyprsenaPlatnost:
      return lang.nelzeZrusit;
    case StavJidla.objednanoNelzeOdebrat:
      return lang.vlozitNaBurzu;
    case StavJidla.dostupneNaBurze:
      return lang.objednatZBurzy;
    case StavJidla.naBurze:
      return lang.odebratZBurzy;
    case StavJidla.nedostupne:
      try {
        bool jeVeDneDostupnyObed = false;
        int prvniIndex = -1;

        for (int i = 0; i < menu.jidla.length; i++) {
          if (menu.jidla[i].lzeObjednat ||
              menu.jidla[i].objednano ||
              loggedInCanteen.jeJidloNaBurze(menu.jidla[i]) ||
              menu.jidla[i].burzaUrl != null) {
            jeVeDneDostupnyObed = true;
            break;
          } else {
            prvniIndex = i;
          }
        }
        if (!jeVeDneDostupnyObed && prvniIndex == menu.jidla.indexOf(dish)) cannotBeOrderedFix(context, dayIndex);
      } catch (e) {
        if (analyticsEnabledGlobally && analytics != null) unawaited(FirebaseCrashlytics.instance.recordError(e, StackTrace.current));

        //hope it's not important
      }
      Uzivatel uzivatel = context.read<UserProvider>().user!.data;
      if (uzivatel.kredit < dish.cena! && !day.isBefore(DateTime.now())) {
        return lang.nedostatekKreditu;
      } else {
        return lang.nelzeObjednat;
      }
    default:
      return '';
  }
}

bool getPrimaryState(StavJidla stavJidla) {
  switch (stavJidla) {
    case StavJidla.objednano:
    case StavJidla.objednanoNelzeOdebrat:
    case StavJidla.objednanoVyprsenaPlatnost:
      return true;
    default:
      return false;
  }
}
