import 'package:autojidelna/src/_global/app.dart';
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
    await Future.wait([
      App.initLocalization(),
      App.initFirebaseMessaging(),
      App.initAppCheck(),
      App.initSecureStorage(),
      App.initGoogleSignIn(),
      App.initPlatform(),
      App.initRotation(),
      App.initCodePush(),
    ]);
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    debugPrint('Initialization took ${elapsed.inMilliseconds} ms');
  }
}
