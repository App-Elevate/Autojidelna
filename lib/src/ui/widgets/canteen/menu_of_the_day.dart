import 'dart:async';

import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/ui/widgets/canteen/dish_list.dart';
import 'package:autojidelna/src/ui/widgets/canteen/error_loading_data.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuOfTheDay extends StatefulWidget {
  const MenuOfTheDay(this.dayIndex, {super.key});
  final int dayIndex;

  @override
  State<MenuOfTheDay> createState() => _MenuOfTheDayState();
}

class _MenuOfTheDayState extends State<MenuOfTheDay> {
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
    return FutureBuilder(
      future: _futureMenu,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const ErrorLoadingData();
        if (snapshot.connectionState == ConnectionState.done) return DishList(widget.dayIndex);

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
