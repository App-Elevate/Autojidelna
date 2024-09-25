import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/_routing/guards.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRouteGuard> guards = [
    MessagingDeepLinkGuard(),
  ];

  @override
  List<AutoRoute> get routes => staticRoutes;
  static final List<AutoRoute> staticRoutes = [
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
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
