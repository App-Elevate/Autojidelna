import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:flutter/foundation.dart';

/// Initialize the app
class InitApp {
  static Future<void> init() async {
    Stopwatch stopwatch = Stopwatch();

    // Start the stopwatch
    stopwatch.start();

    // We're using Future.wait to run multiple Futures in parallel
    // These Futures must take less than 200 ms to run
    await App.initHive();
    await App.initRemoteConfig();
    App.getIt.registerSingleton<AppRouter>(AppRouter());
    await Future.wait([
      App.initLocalization(),
      App.initSecureStorage(),
      App.initPlatform(),
      App.initRotation(),
      App.initCodePush(),
      App.initNotifications(),
    ]);
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    debugPrint('Initialization took ${elapsed.inMilliseconds} ms');
  }
}
