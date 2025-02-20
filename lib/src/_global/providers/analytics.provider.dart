import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AnalyticsProvider extends ChangeNotifier {
  static Box box = Hive.box(Boxes.analytics);

  bool _allowAnalytics = box.get(HiveKeys.allowAnalytics, defaultValue: true);

  /// Analytics getter
  bool get allowAnalytics => _allowAnalytics;

  /// Setter for analytics
  void setAllowAnalytics(bool disabled) {
    _allowAnalytics = disabled;
    unawaited(box.put(HiveKeys.allowAnalytics, _allowAnalytics));
    notifyListeners();
  }
}
