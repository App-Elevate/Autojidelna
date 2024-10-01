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

  static ColorScheme get colorSchemeLight => const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.purpleAccent,
        onPrimary: Colors.white,
        secondary: Color(0x7B009687),
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        surfaceContainerHighest: Colors.black12,
        onSurfaceVariant: Colors.black54,
        scrim: Colors.black54,
        surfaceTint: Colors.black,
        inverseSurface: Color(0xFF121212),
        onInverseSurface: Colors.white,
      );

  static ColorScheme get colorSchemeDark => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffbb86fc),
        onPrimary: Colors.white,
        secondary: Color(0xff018786),
        onSecondary: Colors.white,
        error: Color(0xFFCF6679),
        onError: Colors.white,
        surface: Color(0xff121212),
        onSurface: Colors.white,
        surfaceContainerHighest: Colors.white12,
        onSurfaceVariant: Colors.white54,
        scrim: Colors.black54,
        surfaceTint: Colors.white,
        inverseSurface: Color(0xFFdddddd),
        onInverseSurface: Colors.black,
      );

  static ThemeData theme(ColorScheme colorScheme, bool amoledMode) => ThemeData(
        useMaterial3: true,
        applyElevationOverlayColor: true,

        // COLOR
        colorScheme: colorScheme,
        canvasColor: colorScheme.surface,
        disabledColor: colorScheme.surfaceContainerHighest,
        scaffoldBackgroundColor: colorScheme.surface,
        shadowColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,

        // TYPOGRAPHY & ICONOGRAPHY
        textTheme: textTheme,

        // TODO: COMPONENT THEMES
      );
}
