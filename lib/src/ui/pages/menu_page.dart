import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/ui/widgets/canteen/menu_of_the_day.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key, this.dayIndex});
  final int? dayIndex;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DishesOfTheDay()),
      ],
      child: RefreshIndicator(
        onRefresh: () async {
          //TODO: Implement refresh
        },
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => MenuOfTheDay(index),
        ),
      ),
    );
  }
}
