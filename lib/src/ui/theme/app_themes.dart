import 'package:autojidelna/src/types/custom_bottom_sheet_shape.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static const EdgeInsets horizontalMargin = EdgeInsets.symmetric(horizontal: 16);

  static const TextTheme textTheme = TextTheme(
    bodySmall: /*--------*/ TextStyle(fontFamily: Fonts.body, fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0.4),
    bodyMedium: /*-------*/ TextStyle(fontFamily: Fonts.body, fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0.25),
    bodyLarge: /*--------*/ TextStyle(fontFamily: Fonts.body, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.15),
    labelSmall: /*----*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w500, fontSize: 11, letterSpacing: 0.5),
    labelMedium: /*---*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.5),
    labelLarge: /*----*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.1),
    titleSmall: /*----*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.1),
    titleMedium: /*---*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.15),
    titleLarge: /*----*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 22, letterSpacing: 0),
    headlineSmall: /*-*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 24, letterSpacing: 0),
    headlineMedium: /**/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 28, letterSpacing: 0),
    headlineLarge: /*-*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 32, letterSpacing: 0),
    displaySmall: /*--*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 36, letterSpacing: 0),
    displayMedium: /*-*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 45, letterSpacing: 0),
    displayLarge: /*--*/ TextStyle(fontFamily: Fonts.heading, fontWeight: FontWeight.w400, fontSize: 57, letterSpacing: 0),
  );

  static const Map<ThemeStyle, ColorStyle> colorStyles = {
    ThemeStyle.defaultStyle: ColorStyle(
      primaryLight: Color(0xFFE040FB),
      secondaryLight: Color(0x7B009687),
      primaryDark: Color(0xffbb86fc),
      secondaryDark: Color(0xff018786),
    ),
    ThemeStyle.plumBrown: ColorStyle(
      primaryLight: Color(0xFFAC009E),
      secondaryLight: Color(0xFF815342),
      primaryDark: Color(0xFFA03998),
      secondaryDark: Color(0xFF7F2A0B),
    ),
    ThemeStyle.blueMauve: ColorStyle(
      primaryLight: Color(0xFF3741F7),
      secondaryLight: Color(0xFFA3385F),
      primaryDark: Color(0xFF6264D7),
      secondaryDark: Color(0xFF6F354E),
    ),
    ThemeStyle.rustOlive: ColorStyle(
      primaryLight: Color(0xFFAB4D00),
      secondaryLight: Color(0xFF6D692B),
      primaryDark: Color(0xFFC54F00),
      secondaryDark: Color(0xFF53500C),
    ),
    ThemeStyle.evergreenSlate: ColorStyle(
      primaryLight: Color(0xFF306b1e),
      secondaryLight: Color(0xFF54624d),
      primaryDark: Color(0xBC19A400),
      secondaryDark: Color(0xFF273421),
    ),
    ThemeStyle.crimsonEarth: ColorStyle(
      primaryLight: Color(0xFFbe0f00),
      secondaryLight: Color(0xFF775651),
      primaryDark: Color(0xFFC8423D),
      secondaryDark: Color(0xFF442925),
    ),
  };

  static const ColorScheme colorSchemeLight = ColorScheme(
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

  static ColorScheme colorSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0xffbb86fc),
    onPrimary: Colors.grey.shade300,
    secondary: const Color(0xff018786),
    onSecondary: Colors.grey.shade300,
    error: const Color(0xFFCF6679),
    onError: Colors.grey.shade300,
    surface: const Color(0xff121212),
    onSurface: Colors.grey.shade300,
    surfaceContainerHighest: Colors.white12,
    onSurfaceVariant: Colors.white54,
    scrim: Colors.black54,
    surfaceTint: Colors.white,
    inverseSurface: const Color(0xFFdddddd),
    onInverseSurface: Colors.black,
  );

  static ThemeData theme(ColorScheme colorScheme, {bool amoledMode = false}) {
    if (colorScheme.brightness == Brightness.light) amoledMode = false;

    return ThemeData(
      useMaterial3: true,
      applyElevationOverlayColor: true,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // COLOR
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      dividerColor: colorScheme.onSurfaceVariant,
      disabledColor: colorScheme.surfaceContainerHighest,
      scaffoldBackgroundColor: colorScheme.surface,
      shadowColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,

      // TYPOGRAPHY & ICONOGRAPHY
      textTheme: textTheme,
      typography: Typography.material2021(),

      // COMPONENT THEMES
      iconTheme: IconThemeData(size: 30, color: colorScheme.onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: amoledMode ? Colors.transparent : null,
        scrolledUnderElevation: amoledMode ? 0 : 4,
        elevation: amoledMode ? 0 : 4,
        actionsIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: amoledMode ? Colors.transparent : null,
        elevation: amoledMode ? 0 : 4,
      ),
      cardTheme: CardTheme(
        elevation: amoledMode ? .5 : 2,
        clipBehavior: Clip.hardEdge,
        color: amoledMode ? colorScheme.onInverseSurface : null,
        surfaceTintColor: colorScheme.surfaceTint,
        shadowColor: Colors.transparent,
        margin: horizontalMargin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: amoledMode ? BorderSide(color: colorScheme.surfaceContainerHighest) : BorderSide.none,
        ),
      ),
      dividerTheme: DividerThemeData(color: colorScheme.surfaceContainerHighest),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorScheme.secondary,
        backgroundColor: amoledMode ? Colors.transparent : null,
        surfaceTintColor: colorScheme.surfaceTint,
        elevation: amoledMode ? 0 : 4,
      ),

      // Popups
      snackBarTheme: SnackBarThemeData(
        showCloseIcon: false,
        backgroundColor: colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        insetPadding: const EdgeInsets.all(12),
        elevation: amoledMode ? 0 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: amoledMode ? BorderSide(color: colorScheme.surfaceContainerHighest) : BorderSide.none,
        ),
      ),

      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        elevation: amoledMode ? .5 : 2,
        surfaceTintColor: colorScheme.surfaceTint,
        alignment: Alignment.center,
        iconColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge!.copyWith(color: colorScheme.onSurface),
        contentTextStyle: textTheme.bodyMedium,
        actionsPadding: const EdgeInsets.fromLTRB(12, 0, 16, 7),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: amoledMode ? BorderSide(color: colorScheme.surfaceContainerHighest) : BorderSide.none,
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        errorMaxLines: 1,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: textTheme.bodyMedium,
        hintStyle: textTheme.bodyMedium,
        helperStyle: textTheme.bodyMedium,
      ),

      // List tiles
      listTileTheme: ListTileThemeData(
        dense: false,
        selectedColor: colorScheme.primary,
        iconColor: colorScheme.primary.withOpacity(.75),
        titleTextStyle: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
        subtitleTextStyle: textTheme.bodyMedium!.copyWith(color: colorScheme.onSurfaceVariant),
        visualDensity: VisualDensity.comfortable,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        collapsedTextColor: colorScheme.primary,
        textColor: colorScheme.onSurface,
        childrenPadding: const EdgeInsets.only(bottom: 8),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        modalElevation: amoledMode ? .5 : 2,
        clipBehavior: Clip.hardEdge,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: CustomBottomSheetShape(
          borderRadius: BorderRadius.circular(16),
          side: amoledMode ? BorderSide(color: colorScheme.surfaceContainerHighest) : BorderSide.none,
        ),
      ),

      // Buttons
      switchTheme: const SwitchThemeData(splashRadius: 0),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(textTheme.titleMedium),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return amoledMode ? colorScheme.surfaceContainerHighest.withAlpha(16) : colorScheme.surfaceContainerHighest;
            } // Disabled color
            return colorScheme.primary; // Regular color
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return colorScheme.onSurfaceVariant;
            return colorScheme.onPrimary;
          }),
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(45)),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
          splashFactory: InkRipple.splashFactory,
          alignment: Alignment.center,
          side: WidgetStatePropertyAll(BorderSide(color: amoledMode ? colorScheme.surfaceContainerHighest : Colors.transparent, strokeAlign: 1)),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(splashFactory: NoSplash.splashFactory),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface),
          textStyle: WidgetStatePropertyAll(textTheme.titleMedium),
          splashFactory: NoSplash.splashFactory,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) return colorScheme.primary;
              return Colors.transparent;
            },
          ),
        ),
      ),
    );
  }
}
