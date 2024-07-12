import 'package:coree/src/_conf/hive.dart';
import 'package:coree/src/_global/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Initialize the app
class InitApp {
  static Future<void> initConf() async {
    await Hive.openBox(Boxes.settings);
    Stopwatch stopwatch = Stopwatch();

    // Start the stopwatch
    stopwatch.start();

    // We're using Future.wait to run multiple Futures in parallel
    // These Futures must take less than 200 ms to run
    await Future.wait([
      App.initRemoteConfig(),
      App.initPlatform(),
      App.initLocalization(),
    ]);
    App.initGoogleSignIn();
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    assert(elapsed.inMilliseconds < 200, 'initConf() took too long to run');
  }
}
