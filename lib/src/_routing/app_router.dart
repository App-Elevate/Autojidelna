import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/_routing/guards/auth_guard.dart';
import 'package:autojidelna/src/_routing/guards/onboarding_guard.dart';
import 'package:flutter/material.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: Durations.short3.inMilliseconds,
        reverseDurationInMilliseconds: Durations.short3.inMilliseconds,
      );

  @override
  List<AutoRoute> get routes => staticRoutes;
  static final List<AutoRoute> staticRoutes = [
    AutoRoute(
      page: RouterPage.page,
      path: '/',
      initial: true,
      guards: [OnboardingGuard(), AuthGuard()],
      children: <AutoRoute>[
        AutoRoute(page: MenuPage.page, path: 'menu', initial: true),
        AutoRoute(page: MorePage.page, path: 'more'),
      ],
    ),
    AutoRoute(page: OnboardingPage.page, path: '/onboarding'),
    AutoRoute(page: AccountPickerPage.page, path: '/accounts'),
    AutoRoute(page: DishDetailPage.page, path: '/detail'),
    AutoRoute(page: LoginPage.page, path: '/login'),
    AutoRoute(page: AccountPage.page, path: '/account'),
    AutoRoute(page: StatisticsPage.page, path: '/statistics'),
    AutoRoute(page: SettingsPage.page, path: '/settings'),
    AutoRoute(page: AnalyticsPage.page, path: '/settings/analytics'),
    AutoRoute(page: AppearancePage.page, path: '/settings/appearance'),
    AutoRoute(page: ConveniencePage.page, path: '/settings/convenience'),
    AutoRoute(page: AboutPage.page, path: '/about'),
    AutoRoute(page: RequestPermissionPage.page, path: '/request-permission'),
    AutoRoute(page: DebugPage.page, path: '/demo/debug'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
