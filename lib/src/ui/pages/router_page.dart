import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/ui/pages/crashlytics_page.dart';
import 'package:coree/src/ui/pages/demo_page.dart';
import 'package:coree/src/ui/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

@RoutePage()
class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  int index = 0;
  changeIndex(int newIndex) => setState(() => index = newIndex);
  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return AdaptiveScaffold(
      useDrawer: true,
      transitionDuration: Durations.short4,
      selectedIndex: index,
      bodyRatio: .4,
      onSelectedIndexChange: changeIndex,
      appBarBreakpoint: Breakpoints.smallAndUp,
      destinations: [
        NavigationDestination(label: lang.counting, icon: const Icon(Icons.numbers)),
        NavigationDestination(label: lang.crashlytics, icon: const Icon(Icons.bug_report)),
        NavigationDestination(label: lang.settings, icon: const Icon(Icons.settings)),
      ],
      body: (context) => [
        const DemoPage(),
        const CrashlyticsPage(),
        const SettingsPage(),
      ][index],
      // Only ever use [largeSecondaryBody] in case more content is wanted on the screen
      largeSecondaryBody: (context) => Container(color: Colors.red),
    );
  }
}
