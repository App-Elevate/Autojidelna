import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return AutoTabsScaffold(
      // These should Always be constant.
      routes: const [
        DemoPage(),
        CrashlyticsPage(),
        SettingsPage(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(label: lang.counting, icon: const Icon(Icons.numbers)),
            BottomNavigationBarItem(label: lang.crashlytics, icon: const Icon(Icons.bug_report)),
            BottomNavigationBarItem(label: lang.settings, icon: const Icon(Icons.settings)),
          ],
        );
      },
    );
  }
}
