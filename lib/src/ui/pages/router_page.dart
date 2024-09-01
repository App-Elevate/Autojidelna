import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/ui/widgets/router_page_appbars/crashlytics_page_appbar.dart';
import 'package:coree/src/ui/widgets/router_page_appbars/demo_page_appbar.dart';
import 'package:coree/src/ui/widgets/router_page_appbars/login_page_appbar.dart';
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

  bool isExtended = false;

  changeIndex(int newIndex, TabsRouter tabsRouter) {
    if (!mounted || !context.mounted) return;
    if (Breakpoints.smallDesktop.isActive(context)) changeExtention(context);
    tabsRouter.setActiveIndex(newIndex);
  }

  changeExtention(BuildContext context) {
    if (!mounted || !context.mounted) return;
    if (Breakpoints.smallDesktop.isActive(context) || Breakpoint.activeBreakpointOf(context) == Breakpoints.standard) {
      _key.currentState!.isDrawerOpen ? _key.currentState!.closeDrawer() : _key.currentState!.openDrawer();
    }
    setState(() {
      isExtended = !isExtended;
    });
  }

  final List<PageRouteInfo> routes = [
    const DemoPage(),
    const CrashlyticsPage(),
    const SettingsPage(),
  ];

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

    final List<Widget?> secondaryBodies = [
      null,
      Container(color: Colors.red),
      Container(color: Colors.green),
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

    final breakpoint = Breakpoint.activeBreakpointOf(context) == Breakpoints.standard;
    if (breakpoint) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      print('height: $height, width: $width');
      print('breakpoints: $breakpoint');
      print('breakpointss: $breakpoint');
      print('breakpointsss: $breakpoint');
      print('breakpointssss: $breakpoint');
      print('breakpoinsst: $breakpoint');
      print('breakpoini: $breakpoint');
      print('breakpoisknt: $breakpoint');
    }

    return AutoTabsRouter(
      routes: routes,
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final index = tabsRouter.activeIndex;
        return Scaffold(
          key: _key,
          appBar: appBars[index],
          // First is the mobile view on web. Second is the horizontal view on mobile
          drawer: Breakpoints.smallDesktop.isActive(context) || Breakpoint.activeBreakpointOf(context) == Breakpoints.standard
              ? NavigationDrawer(
                  selectedIndex: index,
                  onDestinationSelected: (value) => changeIndex(value, tabsRouter),
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
                      onDestinationSelected: (value) => changeIndex(value, tabsRouter),
                      destinations: railDestinations,
                    ),
                  ),
                ),
              },
            ),
            body: SlotLayout(
              config: {
                Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key('SmlUpBody'),
                  builder: (context) => child,
                ),
              },
            ),
            secondaryBody: Breakpoints.large.isActive(context) && secondaryBodies[index] != null
                ? SlotLayout(
                    config: {
                      Breakpoints.large: SlotLayout.from(
                        key: const Key('LrgSecBody'),
                        builder: (context) => secondaryBodies[index]!,
                      ),
                    },
                  )
                : null,
            bottomNavigation: isSmallMobile
                ? SlotLayout(
                    config: {
                      Breakpoints.smallMobile: SlotLayout.from(
                        key: const Key('SmlMobileBottomNav'),
                        builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
                          currentIndex: index,
                          onDestinationSelected: (value) => changeIndex(value, tabsRouter),
                          destinations: destinations,
                        ),
                      ),
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}

NavigationDrawerDestination toDrawerDestination(NavigationDestination destination) => NavigationDrawerDestination(
      label: Text(destination.label),
      icon: destination.icon,
      selectedIcon: destination.selectedIcon,
    );
