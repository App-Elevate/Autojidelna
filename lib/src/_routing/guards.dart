import 'dart:async';

import 'package:auto_route/auto_route.dart';
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
            onResult: (success) {
              // if success == true the navigation will be resumed
              // else it will be aborted
              if (resolver.isResolved) return;
              resolver.next(success);
            },
          ),
        ),
      );
    }
  }
}
