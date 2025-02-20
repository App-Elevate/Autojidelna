import 'dart:async';

import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/ui/widgets/canteen/page_view/dish_list.dart';
import 'package:autojidelna/src/ui/widgets/canteen/error_loading_data.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuOfTheDay extends StatefulWidget {
  const MenuOfTheDay(this.date, {super.key});
  final DateTime date;

  @override
  State<MenuOfTheDay> createState() => _MenuOfTheDayState();
}

class _MenuOfTheDayState extends State<MenuOfTheDay> {
  Future<void>? fetchMenu;
  Jidelnicek? cachedMenu;

  @override
  void initState() {
    super.initState();
    // Fetch the data in initState to avoid context issues
    // ignore: discarded_futures
    cachedMenu = context.read<CanteenProvider>().getCachedMenu(widget.date);

    fetchMenu = Future(() async {
      if (mounted) await context.read<CanteenProvider>().getMenu(widget.date);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cachedMenu != null) return DishList(widget.date);
    return FutureBuilder<void>(
      future: Future(() async {
        if (context.mounted) await context.read<CanteenProvider>().getMenu(widget.date);
      }),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const ErrorLoadingData();
        if (snapshot.connectionState == ConnectionState.done) return DishList(widget.date);

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
