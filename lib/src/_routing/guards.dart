import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/messaging.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_messaging/messaging.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';

class MessagingDeepLinkGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
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
      return AppRouter.staticRoutes.any((route) => isValid(route, baseRoute));
    }

    final message = Messaging.messagingProvider.message;
    Messaging.messagingProvider.notificationMessageHandled();
    if (message?.data[MessagingConf.dataPushRoute] != null && isRouteValid(message!.data[MessagingConf.dataPushRoute]!)) {
      final routeName = message.data[MessagingConf.dataPushRoute]!;
      final uri = Uri.parse(routeName);
      final route = uri.path + (uri.hasQuery ? '?${uri.query}' : '');
      Future.delayed(
        Duration.zero,
        () => unawaited(router.root.navigateNamed(route)),
      );
    }
    resolver.next();
  }
}

class NotificationGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (Messaging.grantedPermission || resolver.route.name == RequestPermissionPage.name || !App.shouldAskForNotification) {
      resolver.next();
      return;
    } else {
      unawaited(resolver.redirect(RequestPermissionPage(onResult: (didLogin) => resolver.next(didLogin))));
    }
  }
}
