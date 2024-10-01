import 'package:autojidelna/src/_global/providers/theme.provider.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeStylePicker extends StatelessWidget {
  const ThemeStylePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: Consumer<ThemeProvider>(
        builder: (context, prov, _) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: ThemeStyle.values.length,
          itemBuilder: (context, index) {
            ThemeStyle themeStyle = ThemeStyle.values[index];
            final bool isBright = MediaQuery.platformBrightnessOf(context) == Brightness.light || prov.themeMode == ThemeMode.light;

            ThemeData theme = AppThemes.theme(isBright ? prov.colorSchemeLight(themeStyle) : prov.colorSchemeDark(themeStyle), prov.amoledMode);

            ButtonStyle style = OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              fixedSize: const Size.fromWidth(125),
              padding: EdgeInsets.zero,
              side: BorderSide(
                width: 3,
                strokeAlign: BorderSide.strokeAlignInside,
                color: ThemeStyle.values[index] == prov.themeStyle ? theme.colorScheme.primary : Colors.grey,
              ),
            );

            return Theme(
              data: theme,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: OutlinedButton(
                  style: style,
                  onPressed: () => prov.setThemeStyle(ThemeStyle.values[index]),
                  child: Column(
                    children: [
                      SizedBox(height: 35, child: AppBar(automaticallyImplyLeading: false)),
                      const Divider(color: Colors.transparent),
                      foodTileColorSchemePreview(context, theme.colorScheme.primary),
                      foodTileColorSchemePreview(context, theme.colorScheme.secondary),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget foodTileColorSchemePreview(BuildContext context, Color color) {
    return Card.filled(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        height: 20,
        width: 100,
        margin: const EdgeInsets.fromLTRB(5, 30, 5, 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.5),
        ),
      ),
    );
  }
}
