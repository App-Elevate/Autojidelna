import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/ui/widgets/canteen/menu_of_the_day.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key, this.dayIndex});
  final int? dayIndex;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        //TODO: Implement refresh
      },
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => MenuOfTheDay(index),
      ),
    );
  }
}
