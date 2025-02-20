import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/logic/migration/migration_manager.dart';
import 'package:autojidelna/src/types/app_context.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

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
    App.getIt.registerSingleton<AppContext>(AppContext());
    await Future.wait([
      App.initLocalization(),
      App.initSecureStorage(),
      App.initPlatform(),
      App.initRotation(),
      App.initCodePush(),
      App.initNotifications(),
    ]);
    await MigrationManager.runMigrations();
    // Stop the stopwatch
    stopwatch.stop();

    // Get the elapsed time
    Duration elapsed = stopwatch.elapsed;
    debugPrint('Initialization took ${elapsed.inMilliseconds} ms');
  }

  /// Call this after retrieving the URL
  void registerCanteen(String url) async {
    if (App.getIt.isRegistered<Canteen>()) App.getIt.unregister<Canteen>();
    App.getIt.registerLazySingleton<Canteen>(() => Canteen(url));
  }
}
