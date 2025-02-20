import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Settings with ChangeNotifier {
  static Box box = Hive.box(Boxes.settings);

  ThemeStyle _themeStyle = box.get(HiveKeys.themeStyle, defaultValue: ThemeStyle.defaultStyle);
  ThemeMode _themeMode = box.get(HiveKeys.themeMode, defaultValue: ThemeMode.dark);
  bool _isListUi = box.get(HiveKeys.listUi, defaultValue: false);
  bool _amoledMode = box.get(HiveKeys.amoledMode, defaultValue: false);
  bool _bigCalendarMarkers = box.get(HiveKeys.bigCalendarMarkers, defaultValue: false);
  bool _skipWeekends = box.get(HiveKeys.skipWeekends, defaultValue: false);
  DateFormatOptions _dateFormat = box.get(HiveKeys.dateFormat, defaultValue: DateFormatOptions.dMy);
  bool _relTimeStamps = box.get(HiveKeys.relTimeStamps, defaultValue: false);

  /// Theme style getter
  ThemeStyle get themeStyle => _themeStyle;

  /// Theme mode getter
  ThemeMode get themeMode => _themeMode;

  /// List UI getter
  bool get isListUi => _isListUi;

  /// Amoled mode getter
  bool get amoledMode => _amoledMode;

  /// Big calendar markers getter
  bool get bigCalendarMarkers => _bigCalendarMarkers;

  /// Skip weekends getter
  bool get getSkipWeekends => _skipWeekends;

  /// Date Format getter
  DateFormatOptions get dateFormat => _dateFormat;

  /// Relative TimeStamps getter
  bool get relTimeStamps => _relTimeStamps;

  /// Setter for theme style
  void setThemeStyle(ThemeStyle themeStyle) {
    if (_themeStyle == themeStyle) return;
    _themeStyle = themeStyle;
    unawaited(box.put(HiveKeys.themeStyle, _themeStyle));
    notifyListeners();
  }

  /// Setter for theme mode
  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    unawaited(box.put(HiveKeys.themeMode, _themeMode));
    notifyListeners();
  }

  /// Setter for list UI
  void setListUi(bool isListUi) {
    _isListUi = isListUi;
    unawaited(box.put(HiveKeys.listUi, _isListUi));
    notifyListeners();
  }

  /// Setter for amoled mode
  void setAmoledMode(bool amoledMode) {
    _amoledMode = amoledMode;
    unawaited(box.put(HiveKeys.amoledMode, _amoledMode));
    notifyListeners();
  }

  /// Setter for big calendar markers
  void setCalendarMarkers(bool bigCalendarMarkers) {
    _bigCalendarMarkers = bigCalendarMarkers;
    unawaited(box.put(HiveKeys.bigCalendarMarkers, _bigCalendarMarkers));
    notifyListeners();
  }

  /// Setter for date format
  void setDateFormat(DateFormatOptions dateFormat) {
    _dateFormat = dateFormat;
    unawaited(box.put(HiveKeys.dateFormat, _dateFormat));
    notifyListeners();
  }

  /// Setter for relative timestamps
  void setRelTimeStamps(bool relTimeStamps) {
    _relTimeStamps = relTimeStamps;
    unawaited(box.put(HiveKeys.relTimeStamps, _relTimeStamps));
    notifyListeners();
  }

  /// Setter for skip weekends
  void setSkipWeekends(bool privateSkipWeekends) {
    _skipWeekends = privateSkipWeekends;
    unawaited(box.put(HiveKeys.skipWeekends, _skipWeekends));
    notifyListeners();
  }
}
