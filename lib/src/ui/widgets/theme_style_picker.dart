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
                      SizedBox(height: 35, child: AppBar(automaticallyImplyLeading: false)),
                      const CustomDivider(height: 6),
                      foodTileColorSchemePreview(theme, theme.colorScheme.primary),
                      foodTileColorSchemePreview(theme, theme.colorScheme.secondary),
                      const Expanded(child: SizedBox()),
                      fakeNavigationBar(theme),
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

  SizedBox fakeNavigationBar(ThemeData theme) {
    final Icon icon = Icon(
      Icons.circle,
      size: 4,
      color: theme.colorScheme.onPrimary,
    );
    return SizedBox(
      height: 35,
      child: NavigationBar(
        destinations: [
          const SizedBox(),
          Container(
            height: 10,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: theme.navigationBarTheme.indicatorColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: icon,
          ),
          ...List.generate(
            4,
            (int i) => SizedBox(child: i == 2 ? Padding(padding: EdgeInsets.only(bottom: 4), child: icon) : const SizedBox()),
          ),
        ],
        onDestinationSelected: null,
      ),
    );
  }

  Widget foodTileColorSchemePreview(ThemeData theme, Color buttonColor) {
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
              color: buttonColor,
              borderRadius: BorderRadius.circular(12.5),
            ),
          ),
        ],
      ),
    );
  }
}
