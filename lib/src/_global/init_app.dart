import 'package:coree/src/_global/app.dart';
import 'package:flutter/foundation.dart';

/// Initialize the app
class InitApp {
  static Future<void> init() async {
    Stopwatch stopwatch = Stopwatch();

    // Start the stopwatch
    stopwatch.start();

    // We're using Future.wait to run multiple Futures in parallel
    // These Futures must take less than 200 ms to run
    await Future.wait([
      App.initHive().then(
        (_) async => await Future.wait([
          App.initLocalization(),
        ]),
      ),
      App.initAppCheck(),
      App.initSecureStorage(),
      App.initRemoteConfig(),
      App.initGoogleSignIn(),
      App.initFirebaseMessaging(),
      App.initPlatform(),
    ]);
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    debugPrint('Initialization took ${elapsed.inMilliseconds} ms');
  }
}
