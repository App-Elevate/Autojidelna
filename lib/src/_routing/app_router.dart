import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => staticRoutes;
  static final List<AutoRoute> staticRoutes = [
    AutoRoute(
      page: RouterPage.page,
      initial: true,
      path: '/',
      children: <AutoRoute>[
        AutoRoute(page: MenuPage.page, path: 'menu', initial: true),
        AutoRoute(page: MorePage.page, path: 'more'),
      ],
    ),
    AutoRoute(page: RequestPermissionPage.page, path: '/request-permission'),
    AutoRoute(page: DebugPage.page, path: '/demo/debug'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
