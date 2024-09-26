import 'package:flutter/material.dart';

class ColorStyle {
  Color primaryLight;
  Color secondaryLight;
  Color primaryDark;
  Color secondaryDark;

  ColorStyle({
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
