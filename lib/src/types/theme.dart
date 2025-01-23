import 'package:flutter/material.dart';

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
