import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/ui/widgets/canteen/order_dish_button.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/lined_card.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageViewFoodCard extends StatelessWidget {
  const PageViewFoodCard(this.dish, {super.key});
  final Jidlo dish;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: LinedCard(
        smallButton: false,
        transparentFooterDivider: true,
        title: dish.varianta,
        onPressed: () async => context.router.navigate(DishDetailPage(dish: dish)),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(dish.kategorizovano!.hlavniJidlo!),
              subtitle: dish.cena == null
                  ? null
                  : Text(NumberFormat.simpleCurrency(locale: Localizations.localeOf(context).toLanguageTag()).format(dish.cena)),
            ),
            const CustomDivider(height: 8),
            OrderDishButton(dish),
          ],
        ),
      ),
    );
  }
}
