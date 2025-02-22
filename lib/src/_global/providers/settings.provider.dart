import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Settings with ChangeNotifier {
  static Box box = Hive.box(Boxes.settings);

  bool _isListUi = box.get(HiveKeys.settings.listUi, defaultValue: false);
  bool _bigCalendarMarkers = box.get(HiveKeys.settings.bigCalendarMarkers, defaultValue: false);
  bool _skipWeekends = box.get(HiveKeys.settings.skipWeekends, defaultValue: false);
  DateFormatOptions _dateFormat = box.get(HiveKeys.settings.dateFormat, defaultValue: DateFormatOptions.dMy);
  bool _relTimeStamps = box.get(HiveKeys.settings.relTimeStamps, defaultValue: false);

  /// List UI getter
  bool get isListUi => _isListUi;

  /// Big calendar markers getter
  bool get bigCalendarMarkers => _bigCalendarMarkers;

  /// Skip weekends getter
  bool get getSkipWeekends => _skipWeekends;

  /// Date Format getter
  DateFormatOptions get dateFormat => _dateFormat;

  /// Relative TimeStamps getter
  bool get relTimeStamps => _relTimeStamps;

  /// Setter for list UI
  void setListUi(bool isListUi) {
    _isListUi = isListUi;
    unawaited(box.put(HiveKeys.settings.listUi, _isListUi));
    notifyListeners();
  }

  /// Setter for big calendar markers
  void setCalendarMarkers(bool bigCalendarMarkers) {
    _bigCalendarMarkers = bigCalendarMarkers;
    unawaited(box.put(HiveKeys.settings.bigCalendarMarkers, _bigCalendarMarkers));
    notifyListeners();
  }

  /// Setter for date format
  void setDateFormat(DateFormatOptions dateFormat) {
    _dateFormat = dateFormat;
    unawaited(box.put(HiveKeys.settings.dateFormat, _dateFormat));
    notifyListeners();
  }

  /// Setter for relative timestamps
  void setRelTimeStamps(bool relTimeStamps) {
    _relTimeStamps = relTimeStamps;
    unawaited(box.put(HiveKeys.settings.relTimeStamps, _relTimeStamps));
    notifyListeners();
  }

  /// Setter for skip weekends
  void setSkipWeekends(bool privateSkipWeekends) {
    _skipWeekends = privateSkipWeekends;
    unawaited(box.put(HiveKeys.settings.skipWeekends, _skipWeekends));
    notifyListeners();
  }
}
