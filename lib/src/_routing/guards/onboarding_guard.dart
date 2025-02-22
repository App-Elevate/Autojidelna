import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:hive/hive.dart';

class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    bool isFirstTime = Hive.box(Boxes.appState).get(HiveKeys.appState.firstTime, defaultValue: true);

    if (isFirstTime) {
      resolver.redirect(
        OnboardingPage(
          onCompletedCallback: (onSuccess) {
            Hive.box(Boxes.appState).put(HiveKeys.appState.firstTime, !onSuccess);
            resolver.next(onSuccess);
          },
        ),
      );
    } else {
      resolver.next(true); // Allow navigation
    }
  }
}
