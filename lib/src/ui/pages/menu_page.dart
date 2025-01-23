import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/ui/widgets/canteen/menu_of_the_day.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key, this.dayIndex});
  final int? dayIndex;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    App.pageController = PageController(
      keepPage: true,
      initialPage: convertDateTimeToIndex(DateTime.now()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    App.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        //TODO: Implement refresh
      },
      child: PageView.builder(
        controller: App.pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => MenuOfTheDay(index),
      ),
    );
  }
}
