import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:hive/hive.dart';

class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // TODO: migration compatible
    Hive.box(Boxes.appState).put(HiveKeys.firstTime, true);
    bool isFirstTime = Hive.box(Boxes.appState).get(HiveKeys.firstTime, defaultValue: true);

    if (isFirstTime) {
      resolver.redirect(
        OnboardingPage(
          onCompletedCallback: (onSuccess) {
            Hive.box(Boxes.appState).put(HiveKeys.firstTime, false);
            resolver.next(onSuccess);
          },
        ),
      );
    } else {
      resolver.next(true); // Allow navigation
    }
  }
}
