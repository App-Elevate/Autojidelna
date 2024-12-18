import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/_global/providers/ordering_notifier.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/ordering.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/widgets/canteen/burza_alert_dialog.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDishButton extends StatelessWidget {
  const OrderDishButton(this.dish, {super.key});
  final Jidlo dish;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Consumer<DishesOfTheDay>(
        builder: (context, data, ___) {
          Jidelnicek? menu = data.getMenu(convertDateTimeToIndex(dish.den));
          Jidlo updatedDish = menu!.jidla.where((e) => e.nazev == dish.nazev).first;

          return Consumer<Ordering>(
            builder: (context, prov, ___) {
              ColorScheme colorScheme = Theme.of(context).colorScheme;
              StavJidla stavJidla = getStavJidla(updatedDish);
              bool isPrimary = getPrimaryState(stavJidla);

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPrimary ? colorScheme.primary : colorScheme.secondary,
                  foregroundColor: isPrimary ? colorScheme.onPrimary : colorScheme.onSecondary,
                ),
                onPressed: prov.ordering || !isButtonEnabled(stavJidla) ? null : () => burzaAlertDialog(context, updatedDish, stavJidla),
                child: Text(getObedText(context, updatedDish, stavJidla)),
              );
            },
          );
        },
      ),
    );
  }
}
