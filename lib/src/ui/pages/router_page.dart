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
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int index = 0;
  bool isExtended = false;

  changeIndex(int newIndex) {
    if (Breakpoints.smallDesktop.isActive(context)) changeExtention(context);
    setState(() => index = newIndex);
  }

  changeExtention(BuildContext context) {
    if (Breakpoints.smallDesktop.isActive(context)) isExtended ? _key.currentState!.closeDrawer() : _key.currentState!.openDrawer();
    setState(() => isExtended = !isExtended);
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;

    bool isSmallMobile = Breakpoints.smallMobile.isActive(context);

    final double? leadingWidth = !isSmallMobile ? 64 : null;
    final Widget? leading = !isSmallMobile
        ? Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 16),
            child: DrawerButton(onPressed: () => changeExtention(context)),
          )
        : null;

    final List<PreferredSizeWidget> appBars = [
      DemoPageAppBar(leading: leading, leadingWidth: leadingWidth),
      CrashliticsPageAppBar(leading: leading, leadingWidth: leadingWidth),
      SettingsPageAppBar(leading: leading, leadingWidth: leadingWidth),
    ];

    final List<NavigationDestination> destinations = [
      NavigationDestination(label: lang.counting, icon: const Icon(Icons.numbers)),
      NavigationDestination(label: lang.crashlytics, icon: const Icon(Icons.bug_report)),
      NavigationDestination(label: lang.settings, icon: const Icon(Icons.settings)),
    ];
    final List<NavigationRailDestination> railDestinations =
        destinations.map((NavigationDestination destination) => AdaptiveScaffold.toRailDestination(destination)).toList();
    final List<Widget> drawerDestinations = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
          leading: const Icon(Icons.menu),
          title: const Text('Menu'),
          onTap: () => changeExtention(context),
        ),
      ),
    ];
    drawerDestinations.addAll(destinations.map((NavigationDestination destination) => toDrawerDestination(destination)).toList());

    return Scaffold(
      key: _key,
      appBar: appBars[index],
      drawer: Breakpoints.smallDesktop.isActive(context)
          ? NavigationDrawer(
              selectedIndex: index,
              onDestinationSelected: changeIndex,
              tilePadding: const EdgeInsets.symmetric(horizontal: 8),
              children: drawerDestinations,
            )
          : null,
      body: AdaptiveLayout(
        internalAnimations: true,
        bodyRatio: .4,
        transitionDuration: Durations.short4,
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('medUpPrimNav'),
              inAnimation: AdaptiveScaffold.leftOutIn,
              builder: (context) => IntrinsicWidth(
                child: NavigationRail(
                  extended: isExtended,
                  selectedIndex: index,
                  onDestinationSelected: changeIndex,
                  destinations: railDestinations,
                ),
              ),
            ),
          },
        ),
        body: SlotLayout(
          config: {
            Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key('body'),
              builder: (context) => [
                const DemoPage(),
                const CrashlyticsPage(),
                const SettingsPage(),
              ][index],
            ),
          },
        ),
        secondaryBody: Breakpoints.large.isActive(context)
            ? SlotLayout(
                config: {
                  Breakpoints.large: SlotLayout.from(
                    key: const Key('value'),
                    builder: (context) => Container(color: Colors.red),
                  ),
                },
              )
            : null,
        bottomNavigation: isSmallMobile
            ? SlotLayout(
                config: {
                  Breakpoints.smallMobile: SlotLayout.from(
                    key: const Key('l'),
                    builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
                      currentIndex: index,
                      onDestinationSelected: changeIndex,
                      destinations: destinations,
                    ),
                  ),
                },
              )
            : null,
      ),
    );
    /*return AdaptiveScaffold(
      useDrawer: true,
      transitionDuration: Durations.short4,
      selectedIndex: index,
      bodyRatio: .4,
      onSelectedIndexChange: changeIndex,
      appBarBreakpoint: Breakpoints.smallAndUp,
      destinations: destinations,
      body: (context) => [
        const DemoPage(),
        const CrashlyticsPage(),
        const SettingsPage(),
      ][index],
      // Only ever use [largeSecondaryBody] in case more content is wanted on the screen
      largeSecondaryBody: (context) => Container(color: Colors.red),
    );*/
  }
}

NavigationDrawerDestination toDrawerDestination(NavigationDestination destination) => NavigationDrawerDestination(
      label: Text(destination.label),
      icon: destination.icon,
      selectedIcon: destination.selectedIcon,
    );
