import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/_messaging/messaging.dart';
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
