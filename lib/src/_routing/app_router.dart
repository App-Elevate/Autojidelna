import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_conf/messaging.dart';
import 'package:coree/src/_messaging/messaging.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/_routing/guards.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  bool isValid(AutoRoute route, String baseRoute, {String prevRoute = ''}) {
    if (route.children != null && route.children!.routes.isNotEmpty) {
      final match = route.children!.routes.any((child) => isValid(child, baseRoute, prevRoute: prevRoute + route.path));
      if (match) return true;
    }
    final regexPattern = RegExp('^${(prevRoute + route.path).replaceAllMapped(RegExp(r':\w+'), (match) => r'[^/]+')}\$');
    return regexPattern.hasMatch(baseRoute);
  }

  bool isRouteValid(String routeName) {
    final uri = Uri.parse(routeName);
    String baseRoute = uri.path;
    return routes.any((route) => isValid(route, baseRoute));
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final message = Messaging.messagingProvider.message;
    Messaging.messagingProvider.notificationMessageHandled();
    if (message?.data[MessagingConf.dataPushRoute] != null && isRouteValid(message!.data[MessagingConf.dataPushRoute]!)) {
      final routeName = message.data[MessagingConf.dataPushRoute]!;
      final uri = Uri.parse(routeName);
      final route = uri.path + (uri.hasQuery ? '?${uri.query}' : '');
      resolver.next();
      Future.delayed(
        Duration.zero,
        () => unawaited(router.root.navigateNamed(route)),
      );
      return;
    }
    resolver.next();
    return;
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RouterPage.page,
          initial: true,
          guards: [NotificationGuard()],
          path: '/',
          children: <AutoRoute>[
            AutoRoute(page: DemoPage.page, path: 'demo'),
            AutoRoute(page: CrashlyticsPage.page, path: '', initial: true),
            AutoRoute(
              page: SettingsPage.page,
              path: 'settings',
            ),
          ],
        ),
        AutoRoute(page: RequestPermissionPage.page, path: '/request-permission'),
        AutoRoute(page: DebugPage.page, path: '/demo/debug'),
        AutoRoute(page: RoutingParamPage.page, path: '/settings/param'),
        AutoRoute(page: LocalizationsPage.page, path: '/settings/localizations'),
        AutoRoute(page: RoutingQueryParamDetailPage.page, path: '/settings/param/detail'),
        AutoRoute(page: RoutingPathParamDetailPage.page, path: '/settings/param/:filmid'),
        AutoRoute(page: LoginPage.page, path: '/settings/login'),
        AutoRoute(page: DeleteAccountPage.page, path: '/settings/delete', guards: [AuthGuard()]),
      ];
}
