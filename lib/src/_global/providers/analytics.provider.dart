import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// TODO
class AnalyticsProvider extends ChangeNotifier {
  static Box box = Hive.box(Boxes.analytics);

  bool _allowAnalytics = box.get(HiveKeys.analytics.allowAnalytics, defaultValue: true);
  bool _sendCrashLogs = box.get(HiveKeys.analytics.sendCrashLogs, defaultValue: true);

  /// Analytics getter
  bool get allowAnalytics => _allowAnalytics;
  bool get sendCrashLogs => _sendCrashLogs;

  /// Setter for analytics
  void setAllowAnalytics(bool allow) {
    _allowAnalytics = allow;
    unawaited(box.put(HiveKeys.analytics.allowAnalytics, _allowAnalytics));
    notifyListeners();
  }

  void setSendCrashLogs(bool send) {
    _sendCrashLogs = send;
    unawaited(box.put(HiveKeys.analytics.sendCrashLogs, _sendCrashLogs));
    notifyListeners();
  }
}
