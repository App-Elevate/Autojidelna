import 'package:autojidelna/src/_global/providers/theme.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModePicker extends StatelessWidget {
  const ThemeModePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .9,
      child: Selector<ThemeProvider, ({ThemeMode read, Function(ThemeMode) set})>(
        selector: (_, p1) => (read: p1.themeMode, set: p1.setThemeMode),
        builder: (_, themeMode, __) => SegmentedButton<ThemeMode>(
          showSelectedIcon: false,
          selected: {themeMode.read},
          onSelectionChanged: (Set<ThemeMode> selected) => themeMode.set(selected.first),
          segments: [
            ButtonSegment<ThemeMode>(value: ThemeMode.system, label: Text(lang.themeModeSystem)),
            ButtonSegment<ThemeMode>(value: ThemeMode.light, label: Text(lang.themeModeLight)),
            ButtonSegment<ThemeMode>(value: ThemeMode.dark, label: Text(lang.themeModeDark)),
          ],
        ),
      ),
    );
  }
}
