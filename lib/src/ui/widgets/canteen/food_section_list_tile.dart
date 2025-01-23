import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/_global/providers/ordering_notifier.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/ordering.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/widgets/canteen/burza_alert_dialog.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FoodSectionListTile extends StatelessWidget {
  const FoodSectionListTile({super.key, required this.title, required this.selection});
  final String title;
  final List<Jidlo> selection;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: timeOfDayFoodTitle(context, title),
      subtitle: Column(
        children: selection.asMap().entries.map((data) {
          int index = data.key;
          Jidlo dish = data.value;

          String title = (selection[index].kategorizovano?.hlavniJidlo ?? selection[index].nazev) == ''
              ? selection[index].nazev
              : (selection[index].kategorizovano?.hlavniJidlo ?? selection[index].nazev);

          return _DishListTile(dish: dish, title: title);
        }).toList(),
      ),
    );
  }

  Text timeOfDayFoodTitle(BuildContext context, String text) => Text(text.toUpperCase(), style: Theme.of(context).textTheme.titleSmall);
}

class _DishListTile extends StatelessWidget {
  const _DishListTile({required this.dish, required this.title});
  final Jidlo dish;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Consumer<DishesOfTheDay>(
      builder: (context, data, ___) {
        Jidelnicek? menu = data.getMenu(convertDateTimeToIndex(dish.den));
        Jidlo updatedDish = menu!.jidla.where((e) => e.nazev == dish.nazev).first;
        StavJidla stav = getStavJidla(updatedDish);

        return Consumer<Ordering>(
          builder: (context, prov, ___) => ListTile(
            selectedColor: theme.colorScheme.primary,
            enabled: !prov.ordering && isButtonEnabled(stav),
            selected: getPrimaryState(stav),
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            titleTextStyle: theme.textTheme.bodyMedium,
            leading: Radio<bool>(
              toggleable: true,
              value: getPrimaryState(stav),
              groupValue: true,
              onChanged: prov.ordering || !isButtonEnabled(stav) ? null : (_) => burzaAlertDialog(context, updatedDish, stav),
              activeColor: theme.colorScheme.primary,
            ),
            title: Text(title),
            subtitle: updatedDish.cena == null
                ? null
                : Text(NumberFormat.simpleCurrency(locale: Localizations.localeOf(context).toLanguageTag()).format(updatedDish.cena)),
            trailing: _detailButton(context),
          ),
        );
      },
    );
  }

  IconButton _detailButton(BuildContext context) {
    return IconButton(
      onPressed: () => unawaited(context.router.navigate(DishDetailPage(dish: dish))),
      icon: Icon(
        Icons.info_outline,
        color: Theme.of(context).listTileTheme.subtitleTextStyle!.color,
        size: 24,
      ),
    );
  }
}
