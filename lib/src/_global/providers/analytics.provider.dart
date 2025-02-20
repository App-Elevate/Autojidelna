import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// TODO
class AnalyticsProvider extends ChangeNotifier {
  static Box box = Hive.box(Boxes.analytics);

  bool _allowAnalytics = box.get(HiveKeys.allowAnalytics, defaultValue: true);
  bool _sendCrashLogs = box.get(HiveKeys.sendCrashLogs, defaultValue: true);

  /// Analytics getter
  bool get allowAnalytics => _allowAnalytics;
  bool get sendCrashLogs => _sendCrashLogs;

  /// Setter for analytics
  void setAllowAnalytics(bool allow) {
    _allowAnalytics = allow;
    unawaited(box.put(HiveKeys.allowAnalytics, _allowAnalytics));
    notifyListeners();
  }

  void setSendCrashLogs(bool send) {
    _sendCrashLogs = send;
    unawaited(box.put(HiveKeys.sendCrashLogs, _sendCrashLogs));
    notifyListeners();
  }
}
