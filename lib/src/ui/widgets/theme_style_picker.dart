import 'package:autojidelna/src/_global/providers/theme.provider.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeStylePicker extends StatelessWidget {
  const ThemeStylePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider prov = context.watch<ThemeProvider>();

    return SizedBox(
      height: 225,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: ThemeStyle.values.length,
        itemBuilder: (context, index) {
          ThemeStyle themeStyle = ThemeStyle.values[index];
          final bool isBright = MediaQuery.platformBrightnessOf(context) == Brightness.light || prov.themeMode == ThemeMode.light;

          ThemeData theme = AppThemes.theme(
            isBright ? prov.colorSchemeLight(themeStyle) : prov.colorSchemeDark(themeStyle),
            amoledMode: prov.amoledMode,
          );

          BorderRadius radius = BorderRadius.circular(16);

          ButtonStyle style = OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: radius),
            fixedSize: const Size.fromWidth(125),
            padding: EdgeInsets.zero,
            side: BorderSide(
              width: 3,
              strokeAlign: BorderSide.strokeAlignInside,
              color: ThemeStyle.values[index] == prov.themeStyle ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
            ),
          );

          return Theme(
            data: theme,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: radius,
                clipBehavior: Clip.hardEdge,
                child: OutlinedButton(
                  style: style,
                  onPressed: () => prov.setThemeStyle(ThemeStyle.values[index]),
                  child: Column(
                    children: [
                      SizedBox(height: 35, child: fakeAppbar(context, theme)),
                      const CustomDivider(height: 6),
                      foodTileColorSchemePreview(context, theme, theme.colorScheme.primary),
                      foodTileColorSchemePreview(context, theme, theme.colorScheme.secondary),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar fakeAppbar(BuildContext context, ThemeData theme) => AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        title: Container(
          width: 36,
          height: 18,
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.onSurfaceVariant, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        actions: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.onSurfaceVariant, width: 1),
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
          const SizedBox(width: 8),
        ],
      );

  Widget foodTileColorSchemePreview(BuildContext context, ThemeData theme, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: (theme.cardTheme.shape as RoundedRectangleBorder).copyWith(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const CustomDivider(isTransparent: false),
          Container(
            height: 15,
            width: 100,
            margin: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.5),
            ),
          ),
        ],
      ),
    );
  }
}
