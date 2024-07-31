import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_conf/messaging.dart';
import 'package:coree/src/_messaging/messaging.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/_routing/guards.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  bool isRouteValid(String routeName) {
    final uri = Uri.parse(routeName);
    final baseRoute = uri.path;
    return routes.any((route) {
      // Convert the route pattern to a regex pattern
      final regexPattern = RegExp('^${route.path.replaceAllMapped(RegExp(r':\w+'), (match) => r'[^/]+')}\$');
      return regexPattern.hasMatch(baseRoute);
    });
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
      unawaited(router.pushNamed(route));
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
          path: '/',
          guards: [NotificationGuard()],
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
