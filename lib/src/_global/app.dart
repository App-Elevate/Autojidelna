import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/providers/remote_config.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

/// Global app class.
///
/// This class is used to initialize global variables and services.
///
/// You can use this class to get:
///
/// Remote config: [remoteConfig]
///
/// Package info: [packageInfo]
///
/// Secure storage: [secureStorage]
class App {
  static bool _initPlatformExecuted = false;
  static bool _initLocalizationExecuted = false;
  static bool _initRemoteConfigExecuted = false;
  static bool _initHiveExecuted = false;
  static bool _initRotationExecuted = false;
  static bool _initCodePushExecuted = false;

  static Future<void> initCodePush() async {
    assert(_initCodePushExecuted == false, 'App.initCodePush() must be called only once');
    if (_initCodePushExecuted) return;

    currentPatchNumber = await ShorebirdCodePush().currentPatchNumber();
    if (!kDebugMode) {
      Sentry.configureScope((scope) {
        scope.setTag('shorebird_patch_number', '$currentPatchNumber');
      });
    }
    if (!kDebugMode && !kProfileMode && !kIsWeb) {
      FirebaseCrashlytics.instance.setCustomKey(
        'shorebird_patch_number',
        '$currentPatchNumber',
      );
    }

    _initCodePushExecuted = true;
  }

  static Future<void> initPlatform() async {
    assert(_initPlatformExecuted == false, 'App.initPlatform() must be called only once');
    if (_initPlatformExecuted) return;

    packageInfo = await PackageInfo.fromPlatform();

    _initPlatformExecuted = true;
  }

  static Future<void> initLocalization() async {
    assert(_initLocalizationExecuted == false, 'App.initLocalization() must be called only once');
    if (_initLocalizationExecuted) return;

    final Box box = Hive.box(Boxes.settings);
    String locale = box.get(HiveKeys.locale, defaultValue: PlatformDispatcher.instance.locale.languageCode);
    currentLocale = Locale.fromSubtags(languageCode: locale);
    box.put(HiveKeys.locale, locale);

    _initLocalizationExecuted = true;
  }

  static Future<void> initRotation() async {
    assert(_initRotationExecuted == false, 'App.initRemoteConfig() must be called only once');
    if (_initRotationExecuted) return;

    SystemChrome.setPreferredOrientations(App.defaultRotations);

    _initRotationExecuted = true;
  }

  static Future<void> initRemoteConfig() async {
    assert(_initRemoteConfigExecuted == false, 'App.initRemoteConfig() must be called only once');
    if (_initRemoteConfigExecuted) return;

    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfigProvider.init();

    _initRemoteConfigExecuted = true;
  }

  static Future<void> initHive() async {
    assert(_initHiveExecuted == false, 'App.initHive() must be called only once');
    if (_initHiveExecuted) return;

    await Hive.initFlutter();
    await Hive.openBox(Boxes.settings);
    await Hive.openBox(Boxes.cache);

    _initHiveExecuted = true;
  }

  static Future<void> initSecureStorage() async {
    secureStorage = const FlutterSecureStorage();
  }

  static late final FlutterSecureStorage secureStorage;

  static late final FirebaseRemoteConfig remoteConfig;

  static Locale currentLocale = defaultLocale;

  static late final PackageInfo packageInfo;

  static late final bool shouldAskForNotification;

  static late final int? currentPatchNumber;

  static final remoteConfigProvider = Rmc();

  static const defaultLocale = Locale('en');

  static const defaultRotations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  /// This function is used to change the language of the app.
  ///
  /// You can also pass null to this function to to translate to the default language.
  ///
  /// Do not call this before MaterialApp is built.
  static late Function(Locale? language) translate;
}
