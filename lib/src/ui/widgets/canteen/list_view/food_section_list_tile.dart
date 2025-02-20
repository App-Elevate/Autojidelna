import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
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

    return Selector<CanteenProvider, bool>(
      selector: (_, p1) => p1.ordering,
      builder: (context, ordering, ___) {
        final StavJidla stav = getStavJidla(context, dish);
        final bool enabled = ordering || !isButtonEnabled(stav);
        final bool selected = getPrimaryState(stav);
        const onTap = burzaAlertDialog;

        return ListTile(
          enabled: ordering && isButtonEnabled(stav),
          selected: selected,
          contentPadding: EdgeInsets.zero,
          selectedColor: theme.colorScheme.primary,
          titleTextStyle: theme.textTheme.bodyMedium,
          onTap: enabled ? null : () => onTap(context, dish, stav),
          leading: Radio<bool>(
            toggleable: true,
            groupValue: true,
            value: selected,
            onChanged: enabled ? null : (_) => onTap(context, dish, stav),
            activeColor: theme.colorScheme.primary,
          ),
          title: Text(title),
          subtitle: _subtitle(context, dish.cena),
          trailing: _detailButton(context),
        );
      },
    );
  }

  Text? _subtitle(BuildContext context, double? price) {
    if (price == null) return null;
    return Text(NumberFormat.simpleCurrency(locale: Localizations.localeOf(context).toLanguageTag()).format(price));
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
