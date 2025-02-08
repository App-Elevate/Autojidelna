import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Selector<CanteenProvider, bool>(
        selector: (_, p1) => p1.ordering,
        builder: (context, ordering, ___) {
          StavJidla stav = getStavJidla(dish);
          bool isPrimary = getPrimaryState(stav);

          return FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: isPrimary ? colorScheme.primary : colorScheme.secondary,
              foregroundColor: isPrimary ? colorScheme.onPrimary : colorScheme.onSecondary,
            ),
            onPressed: ordering || !isButtonEnabled(stav) ? null : () => burzaAlertDialog(context, dish, stav),
            child: Text(getObedText(context, dish, stav)),
          );
        },
      ),
    );
  }
}
