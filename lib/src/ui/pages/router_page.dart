import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/router_page_appbars/default_appbar.dart';
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
    // TODO
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

    final defaultAppBar = DefaultAppbar(leading: leading, leadingWidth: leadingWidth);

    // use null to not show an appbar for a specific page. Use the defaultAppBar for a default appbar
    // note: using null will not show the appbar at all. This includes the navigation drawer button. Use with caution.
    final List<PreferredSizeWidget Function(BuildContext context)?> appBars = [
      // TODO
    ];

    final List<NavigationDestination> destinations = [
      // TODO
    ];

    final List<Widget?> secondaryBodies = [
      // TODO
    ];

    assert(
      appBars.length == destinations.length && destinations.length == routes.length && secondaryBodies.length == destinations.length,
      'The number of appBars, destinations, routes and secondaryBodies must be equal',
    );

    final List<NavigationRailDestination> railDestinations =
        destinations.map((NavigationDestination destination) => AdaptiveScaffold.toRailDestination(destination)).toList();

    final List<Widget> drawerDestinations = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
          leading: const Icon(Icons.menu),
          title: const Text('Menu'), // TODO: add to localizations
          onTap: () => changeExtention(context),
        ),
      ),
    ];
    drawerDestinations.addAll(destinations.map((NavigationDestination destination) => toDrawerDestination(destination)).toList());

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
          appBar: appBars[index]?.call(context),
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
