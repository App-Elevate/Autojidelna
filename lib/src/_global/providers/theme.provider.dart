import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  static Box box = Hive.box(Boxes.settings);

  ThemeStyle _themeStyle = box.get(HiveKeys.themeStyle, defaultValue: ThemeStyle.defaultStyle);
  ThemeMode _themeMode = box.get(HiveKeys.themeMode, defaultValue: ThemeMode.system);
  bool _amoledMode = box.get(HiveKeys.amoledMode, defaultValue: false);

  /// Theme style getter
  ThemeStyle get themeStyle => _themeStyle;

  /// Theme mode getter
  ThemeMode get themeMode => _themeMode;

  /// Pure black getter
  bool get amoledMode => _amoledMode;

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

  /// Setter for pure black
  void setAmoledMode(bool isPureBlack) {
    _amoledMode = isPureBlack;
    unawaited(box.put(HiveKeys.amoledMode, _amoledMode));
    notifyListeners();
  }

  ColorScheme colorSchemeLight(ThemeStyle themeStyle) {
    ColorStyle colorStyle = AppThemes.colorStyles[themeStyle]!;

    return AppThemes.colorSchemeLight.copyWith(
      primary: colorStyle.primaryLight,
      secondary: colorStyle.secondaryLight,
    );
  }

  ColorScheme colorSchemeDark(ThemeStyle themeStyle) {
    ColorStyle colorStyle = AppThemes.colorStyles[themeStyle]!;

    return AppThemes.colorSchemeDark.copyWith(
      primary: colorStyle.primaryDark,
      secondary: colorStyle.secondaryDark,
      surface: amoledMode ? Colors.black : const Color(0xff121212),
      scrim: amoledMode ? Colors.black87 : Colors.black54,
    );
  }
}
