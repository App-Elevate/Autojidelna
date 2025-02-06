import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/ui/widgets/canteen/page_view/menu_of_the_day.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageViewCanteen extends StatefulWidget {
  const PageViewCanteen({super.key});

  @override
  State<PageViewCanteen> createState() => _PageViewCanteenState();
}

class _PageViewCanteenState extends State<PageViewCanteen> {
  @override
  void initState() {
    super.initState();
    App.pageController = PageController(
      keepPage: true,
      initialPage: convertDateTimeToIndex(DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        //TODO: Implement refresh
      },
      child: PageView.builder(
        controller: App.pageController,
        onPageChanged: context.read<DishesOfTheDay>().setDayIndex,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => MenuOfTheDay(index),
      ),
    );
  }
}
