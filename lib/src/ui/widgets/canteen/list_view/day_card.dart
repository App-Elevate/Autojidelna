import 'dart:async';

import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/get_correct_date_string.dart';
import 'package:autojidelna/src/logic/string_extension.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/widgets/canteen/error_loading_data.dart';
import 'package:autojidelna/src/ui/widgets/canteen/list_view/food_section_list_tile.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayCard extends StatefulWidget {
  const DayCard(this.dayIndex, {super.key});
  final int dayIndex;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  Future<Jidelnicek>? _futureMenu;

  @override
  void initState() {
    super.initState();
    // Fetch the data in initState to avoid context issues
    // ignore: discarded_futures
    _futureMenu = loggedInCanteen.getLunchesForDay(convertIndexToDatetime(widget.dayIndex));
    unawaited(
      _futureMenu!.then((menu) {
        if (mounted) context.read<DishesOfTheDay>().setMenu(widget.dayIndex, menu);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Jidelnicek>(
      future: _futureMenu,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const ErrorLoadingData();
        if (snapshot.connectionState == ConnectionState.done) return _DayCard(widget.dayIndex);

        return SizedBox(
          height: MediaQuery.sizeOf(context).height * .4,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard(this.dayIndex);
  final int dayIndex;
  @override
  Widget build(BuildContext context) {
    return Selector<DishesOfTheDay, Jidelnicek? Function(int)>(
      selector: (_, p1) => p1.getMenu,
      builder: (_, getMenu, ___) {
        Jidelnicek? menu = getMenu(dayIndex);
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
