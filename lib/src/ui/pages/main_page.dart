import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        DemoPage(title: 'Users'),
        const CrashlyticsPage(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.people)),
            BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.post_add)),
            BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
          ],
        );
      },
    );
  }
}
