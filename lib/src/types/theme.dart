import 'package:flutter/material.dart';

/// Used by the app for different color combinations
class ColorStyle {
  final Color primaryLight;
  final Color secondaryLight;
  final Color primaryDark;
  final Color secondaryDark;

  const ColorStyle({
    required this.primaryLight,
    required this.secondaryLight,
    required this.primaryDark,
    required this.secondaryDark,
  });
}

/// Describes what ColorStyle will be used by the app
enum ThemeStyle {
  defaultStyle,
  plumBrown,
  blueMauve,
  rustOlive,
  evergreenSlate,
  crimsonEarth,
}

/// Used by custom date picker to decide how to render a cell
enum CellState {
  today,
  selected,
  ordered,
  available,
}

/// Describes what time format will be used by the app
enum DateFormatOptions {
  dMy,
  mmddyy,
  ddmmyy,
  yyyymmdd,
  ddmmmyyyy,
  mmmddyyyy,
}

/// Class containing all fonts used by the apps
class Fonts {
  static const String body = 'Inter';
  static const String heading = 'Lexend';
}
