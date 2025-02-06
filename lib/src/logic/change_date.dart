import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

changeDate(BuildContext context, DateTime newDate, {bool animate = true}) async {
  if (!App.pageController.hasClients) return;
  final int dayIndex = convertDateTimeToIndex(newDate);

  context.read<DishesOfTheDay>().setDayIndex(dayIndex);

  if (!animate) {
    App.pageController.jumpToPage(dayIndex);
    return;
  }

  App.pageController.animateToPage(dayIndex, duration: Durations.medium1, curve: Curves.easeInOut);
}
