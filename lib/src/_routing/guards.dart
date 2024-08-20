import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_conf/messaging.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/_messaging/messaging.dart';
import 'package:coree/src/_routing/app_router.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (FirebaseAuth.instance.currentUser != null) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      unawaited(
        resolver.redirect(
          LoginPage(
            onResult: (user) {
              // if success == true the navigation will be resumed
              // else it will be aborted
              if (resolver.isResolved) return;
              resolver.next(user != null);
            },
          ),
        ),
      );
    }
  }
}

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

class GoogleGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.providerData.any((element) => element.providerId == 'google.com')) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      unawaited(
        resolver.redirect(
          LoginPage(
            onResult: (user) {
              // if success == true the navigation will be resumed
              // else it will be aborted
              if (resolver.isResolved) return;
              resolver.next(user != null && user.providerData.any((element) => element.providerId == 'google.com'));
            },
            providerId: 'google.com',
          ),
        ),
      );
    }
  }
}

class AppleGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.providerData.any((element) => element.providerId == 'apple.com')) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      unawaited(
        resolver.redirect(
          LoginPage(
            onResult: (user) {
              // if success == true the navigation will be resumed
              // else it will be aborted
              if (resolver.isResolved) return;
              resolver.next(user != null && user.providerData.any((element) => element.providerId == 'apple.com'));
            },
            providerId: 'apple.com',
          ),
        ),
      );
    }
  }
}
