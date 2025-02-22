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

  @override
  void initState() {
    super.initState();
    fetchMenu = Future(() async {
      if (!mounted) return;
      Jidelnicek? cachedMenu = context.read<CanteenProvider>().getCachedMenu(widget.date);
      if (cachedMenu == null) await context.read<CanteenProvider>().getMenu(widget.date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchMenu,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const ErrorLoadingData();
        if (snapshot.connectionState == ConnectionState.done) return DishList(widget.date);

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
