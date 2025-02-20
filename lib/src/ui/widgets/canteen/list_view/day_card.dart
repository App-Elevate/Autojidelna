import 'dart:async';

import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/logic/get_correct_date_string.dart';
import 'package:autojidelna/src/logic/string_extension.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/widgets/canteen/error_loading_data.dart';
import 'package:autojidelna/src/ui/widgets/canteen/list_view/food_section_list_tile.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayCard extends StatefulWidget {
  const DayCard(this.date, {super.key});
  final DateTime date;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  Future<void>? fetchMenu;

  @override
  void initState() {
    super.initState();
    // Fetch the data in initState to avoid context issues
    // ignore: discarded_futures
    fetchMenu = Future(() async {
      if (!mounted) return;
      Jidelnicek? cachedMenu = context.read<CanteenProvider>().getCachedMenu(widget.date);
      if (cachedMenu == null) await context.read<CanteenProvider>().getMenu(widget.date);
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchMenu,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const ErrorLoadingData();
        if (snapshot.connectionState == ConnectionState.done) return _DayCard(widget.date);

        return SizedBox(
          height: MediaQuery.sizeOf(context).height * .3,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard(this.date);
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    Jidelnicek? menu = context.read<CanteenProvider>().getCachedMenu(date);
    if (menu == null) return const Center(child: CircularProgressIndicator());

    Map<String, List<Jidlo>> sortedDishes = mapDishesByVarianta(menu.jidla);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          DayCardheader(date: menu.den),
          if (menu.jidla.isNotEmpty) ...[const CustomDivider(isTransparent: false, height: 0), const SizedBox(height: 8)],
          ...sortedDishes.entries.map((e) => FoodSectionListTile(title: e.key.toUpperCase(), selection: e.value)),
        ],
      ),
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
