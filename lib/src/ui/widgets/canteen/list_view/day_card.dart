import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/logic/get_correct_date_string.dart';
import 'package:autojidelna/src/logic/string_extension.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/widgets/canteen/list_view/food_section_list_tile.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayCard extends StatelessWidget {
  const DayCard(this.date, {super.key});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Selector<CanteenProvider, Jidelnicek?>(
      selector: (_, p1) => p1.getCachedMenu(date),
      builder: (_, menu, ___) {
        Map<String, List<Jidlo>> sortedDishes = {};
        if (menu == null) {
          try {
            // ignore: discarded_futures
            context.read<CanteenProvider>().getMenu(date);
          } catch (e) {
            // ignore: discarded_futures
            showInternetConnectionSnackBar();
          }
        } else {
          sortedDishes = mapDishesByVarianta(menu.jidla);
        }

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              DayCardheader(date: date),
              if (menu != null && menu.jidla.isNotEmpty) ...[const CustomDivider(isTransparent: false, height: 0), const SizedBox(height: 8)],
              ...sortedDishes.entries.map((e) => FoodSectionListTile(title: e.key.toUpperCase(), selection: e.value)),
            ],
          ),
        );
      },
    );
  }
}

// Using regular expression to remove digits and extra spaces ['OBĚD 1' => 'OBĚD']
String normalizeVarianta(String varianta) => varianta.replaceAll(RegExp(r'\d'), '').trim();

// Group dishes by normalized `varianta`
Map<String, List<Jidlo>> mapDishesByVarianta(List<Jidlo> dishes) {
  Map<String, List<Jidlo>> mappedDishes = {};

  for (Jidlo dish in dishes) {
    String normalizedVarianta = normalizeVarianta(dish.varianta);

    if (mappedDishes.containsKey(normalizedVarianta)) {
      mappedDishes[normalizedVarianta]!.add(dish);
    } else {
      mappedDishes[normalizedVarianta] = [dish];
    }
  }

  return mappedDishes;
}

class DayCardheader extends StatelessWidget {
  const DayCardheader({required this.date, super.key});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Selector<Settings, DateFormatOptions>(
        selector: (p0, p1) => p1.dateFormat,
        builder: (context, format, ___) {
          String day = DateFormat('EEEE', Localizations.localeOf(context).toLanguageTag()).format(date).capitalize();
          return Text(
            '$day - ${getCorrectDateString(format, date: date)}',
            style: Theme.of(context).textTheme.titleMedium,
          );
        },
      ),
    );
  }
}
