import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RouterPage.page,
          initial: true,
          path: '/',
          children: <AutoRoute>[
            AutoRoute(page: DemoPage.page, path: 'demo'),
            AutoRoute(page: CrashlyticsPage.page, path: '', initial: true),
            AutoRoute(
              page: RoutingTestPage.page,
              path: 'settings',
            ),
          ],
        ),
        AutoRoute(page: RoutingParamPage.page, path: '/settings/param'),
        AutoRoute(page: LocalizationsPage.page, path: '/settings/localizations'),
        AutoRoute(page: RoutingQueryParamDetailPage.page, path: '/settings/param/detail'),
        AutoRoute(page: RoutingPathParamDetailPage.page, path: '/settings/param/:filmid'),
        AutoRoute(page: RoutingTestDetailPage.page, path: '/settings/detail'),
        AutoRoute(page: RoutingTestDetailDetail.page, path: '/settings/detail/detail'),
        AutoRoute(page: ProviderTestPage.page, path: '/settings/provider')
      ];
}
