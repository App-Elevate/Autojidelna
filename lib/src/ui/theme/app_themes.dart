import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static TextTheme get textTheme => const TextTheme(
        bodySmall: TextStyle(fontFamily: Fonts.body),
        bodyMedium: TextStyle(fontFamily: Fonts.body),
        bodyLarge: TextStyle(fontFamily: Fonts.body),
        labelSmall: TextStyle(fontFamily: Fonts.headings),
        labelMedium: TextStyle(fontFamily: Fonts.headings),
        labelLarge: TextStyle(fontFamily: Fonts.headings),
        titleSmall: TextStyle(fontFamily: Fonts.headings),
        titleMedium: TextStyle(fontFamily: Fonts.headings),
        titleLarge: TextStyle(fontFamily: Fonts.headings),
        headlineSmall: TextStyle(fontFamily: Fonts.headings),
        headlineMedium: TextStyle(fontFamily: Fonts.headings),
        headlineLarge: TextStyle(fontFamily: Fonts.headings),
        displaySmall: TextStyle(fontFamily: Fonts.headings),
        displayMedium: TextStyle(fontFamily: Fonts.headings),
        displayLarge: TextStyle(fontFamily: Fonts.headings),
      );

  static Map<ThemeStyle, ColorStyle> get colorStyles => {
        ThemeStyle.defaultStyle: ColorStyle(
          primaryLight: const Color(0xFFE040FB),
          secondaryLight: const Color(0x7B009687),
          primaryDark: const Color(0xffbb86fc),
          secondaryDark: const Color(0xff018786),
        ),
        ThemeStyle.plumBrown: ColorStyle(
          primaryLight: const Color(0xFFAC009E),
          secondaryLight: const Color(0xFF815342),
          primaryDark: const Color(0xFFA03998),
          secondaryDark: const Color(0xFF7F2A0B),
        ),
        ThemeStyle.blueMauve: ColorStyle(
          primaryLight: const Color(0xFF3741F7),
          secondaryLight: const Color(0xFFA3385F),
          primaryDark: const Color(0xFF6264D7),
          secondaryDark: const Color(0xFF6F354E),
        ),
        ThemeStyle.rustOlive: ColorStyle(
          primaryLight: const Color(0xFFAB4D00),
          secondaryLight: const Color(0xFF6D692B),
          primaryDark: const Color(0xFFC54F00),
          secondaryDark: const Color(0xFF53500C),
        ),
        ThemeStyle.evergreenSlate: ColorStyle(
          primaryLight: const Color(0xFF306b1e),
          secondaryLight: const Color(0xFF54624d),
          primaryDark: const Color(0xBC19A400),
          secondaryDark: const Color(0xFF273421),
        ),
        ThemeStyle.crimsonEarth: ColorStyle(
          primaryLight: const Color(0xFFbe0f00),
          secondaryLight: const Color(0xFF775651),
          primaryDark: const Color(0xFFC8423D),
          secondaryDark: const Color(0xFF442925),
        ),
      };

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        applyElevationOverlayColor: true,

        // COLOR
        // colorScheme: ColorSheme is gotten from ThemeProvider

        // TYPOGRAPHY & ICONOGRAPHY
        textTheme: textTheme,

        // TODO: COMPONENT THEMES
      );
}
