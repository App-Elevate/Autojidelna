import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        DemoPage(title: 'Users'),
        const CrashlyticsPage(),
        const RoutingTestPage(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Counting', icon: Icon(Icons.numbers)),
            BottomNavigationBarItem(label: 'Crashlytics', icon: Icon(Icons.bug_report)),
            BottomNavigationBarItem(label: 'Routing', icon: Icon(Icons.settings)),
          ],
        );
      },
    );
  }
}
