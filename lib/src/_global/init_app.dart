import 'package:coree/src/_conf/hive.dart';
import 'package:coree/src/_connection/is_online.dart';
import 'package:coree/src/_global/app.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    assert(elapsed.inMilliseconds < 200, 'initConf() took too long to run');
  }

  static Future<void> initOnline() async {
    if (!await IsOnline.local()) {
      return;
    }
    Stopwatch stopwatch = Stopwatch();

    // Start the stopwatch
    stopwatch.start();

    // We're using Future.wait to run multiple Futures in parallel
    await Future.wait([
      AppOnline.initOnline(),
    ]);
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    debugPrint('initOnline() took ${elapsed.inMilliseconds} ms to run');
  }
}
