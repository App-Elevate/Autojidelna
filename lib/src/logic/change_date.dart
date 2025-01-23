import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:flutter/material.dart';

changeDate(DateTime newDate, {bool animate = true}) async {
  if (!App.pageController.hasClients) return;

  if (!animate) {
    App.pageController.jumpToPage(convertDateTimeToIndex(newDate));
    return;
  }

  App.pageController.animateToPage(convertDateTimeToIndex(newDate), duration: Durations.medium1, curve: Curves.easeInOut);
}
