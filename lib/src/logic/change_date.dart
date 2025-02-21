import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

changeDate(BuildContext context, DateTime newDate, {bool animate = true}) async {
  if (!App.pageController.hasClients && !App.listController.hasClients) return;

  context.read<CanteenProvider>().setSelectedDate(newDate);
  final int dayIndex = convertDateTimeToIndex(newDate);

  if (!animate) {
    context.read<Settings>().isListUi ? App.listController.sliverController.jumpToIndex(dayIndex) : App.pageController.jumpToPage(dayIndex);
    return;
  }

  context.read<Settings>().isListUi
      ? App.listController.sliverController.animateToIndex(dayIndex, duration: Durations.medium1, curve: Curves.easeInOut)
      : App.pageController.animateToPage(dayIndex, duration: Durations.medium1, curve: Curves.easeInOut);
}
