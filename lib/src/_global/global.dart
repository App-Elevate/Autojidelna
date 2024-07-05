import 'package:coree/src/_global/package_info.dart';

class InitApp {
  static Future<void> initConf() async {
    Stopwatch stopwatch = Stopwatch();

    // Start the stopwatch
    stopwatch.start();

    // We're using Future.wait to run multiple Futures in parallel
    // These Futures must take less than 200 ms to run
    await Future.wait([
      App.init(),
    ]);
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    assert(elapsed.inMilliseconds < 200, 'initConf() took too long to run');
  }
}
