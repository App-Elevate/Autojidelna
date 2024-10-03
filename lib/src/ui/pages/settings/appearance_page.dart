import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/theme.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/date_format_picker.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:autojidelna/src/ui/widgets/theme_mode_picker.dart';
import 'package:autojidelna/src/ui/widgets/theme_style_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AppearancePage extends StatelessWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    final bool isLightMode = context.select<ThemeProvider, ThemeMode>((value) => value.themeMode) == ThemeMode.light;
    final bool isBright = MediaQuery.platformBrightnessOf(context) == Brightness.light || isLightMode;

    return Scaffold(
      appBar: AppBar(title: Text(lang.appearance)),
      body: ScrollViewColumn(
        children: [
          SectionTitle(lang.theme),
          const CustomDivider(height: 24),
          const ThemeModePicker(),
          const CustomDivider(height: 38),
          const ThemeStylePicker(),
          const CustomDivider(height: 30),
          Selector<ThemeProvider, ({bool read, Function(bool) set})>(
            selector: (_, p1) => (read: p1.amoledMode, set: p1.setAmoledMode),
            builder: (context, amoledMode, child) => SwitchListTile(
              title: Text(lang.amoledMode),
              subtitle: Text(lang.amoledModeSubtitle),
              value: amoledMode.read,
              onChanged: isBright ? null : amoledMode.set,
            ),
          ),
          SectionTitle(lang.view),
          const DateFormatPickerListTile(),
        ],
      ),
    );
  }
}
