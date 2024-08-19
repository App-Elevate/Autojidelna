import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryTabObserver extends AutoRouterObserver {
  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    /*
    unawaited(
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: 'Navigated to ${route.name}',
          category: 'navigation',
          data: {
            'state': 'didPush',
            if (previousRoute?.name != null) 'from': previousRoute?.name,
            'to': route.name,
          },
        ),
      ),
    );*/
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    unawaited(
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: 'Navigated to ${route.name}',
          category: 'navigation',
          data: {
            'state': 'didPush',
            'from': previousRoute.name,
            'to': route.name,
          },
        ),
      ),
    );
  }
}
