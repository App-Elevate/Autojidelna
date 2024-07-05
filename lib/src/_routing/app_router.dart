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
              path: 'routing-test',
            ),
          ],
        ),
        AutoRoute(page: RoutingParamPage.page, path: '/routing-test/param'),
        AutoRoute(page: RoutingQueryParamDetailPage.page, path: '/routing-test/param/detail'),
        AutoRoute(page: RoutingPathParamDetailPage.page, path: '/routing-test/param/:filmid'),
        AutoRoute(page: RoutingTestDetailPage.page, path: '/routing-test/detail'),
        AutoRoute(page: RoutingTestDetailDetail.page, path: '/routing-test/detail/detail'),
      ];
}
