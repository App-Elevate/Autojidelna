import 'package:coree/src/_conf/hive.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Global app class.
///
/// This class is used to initialize global variables and services.
///
/// You can use this class to get:
///
/// Remote config: [remoteConfig]
///
/// Google sign in: [googleSignIn]
///
/// Localization: [localization]
///
/// Initial locale: [initLocale] (To get the current locale, use [localization])
///
/// Package info: [packageInfo]
///
/// Secure storage: [secureStorage]
class App {
  static bool _initPlatformExecuted = false;
  static bool _initLocalizationExecuted = false;
  static bool _initRemoteConfigExecuted = false;
  static bool _initGoogleSignInExecuted = false;
  static bool _initHiveExecuted = false;
  static Future<void> initPlatform() async {
    assert(_initPlatformExecuted == false, 'App.initPlatform() must be called only once');
    if (_initPlatformExecuted) return;

    packageInfo = await PackageInfo.fromPlatform();

    _initPlatformExecuted = true;
  }

  static Future<void> initLocalization() async {
    assert(_initLocalizationExecuted == false, 'App.initLocalization() must be called only once');
    if (_initLocalizationExecuted) return;

    localization = FlutterLocalization.instance;

    final Box box = Hive.box(Boxes.settings);
    String locale = box.get(HiveKeys.locale, defaultValue: PlatformDispatcher.instance.locale.languageCode);
    initLocale = Locale.fromSubtags(languageCode: locale);
    box.put(HiveKeys.locale, locale);

    _initLocalizationExecuted = true;
  }

  static Future<void> initRemoteConfig() async {
    assert(_initRemoteConfigExecuted == false, 'App.initRemoteConfig() must be called only once');
    if (_initRemoteConfigExecuted) return;

    remoteConfig = FirebaseRemoteConfig.instance;

    _initRemoteConfigExecuted = true;
  }

  static Future<void> initGoogleSignIn() async {
    assert(_initGoogleSignInExecuted == false, 'App.initRemoteConfig() must be called only once');
    if (_initGoogleSignInExecuted) return;
    const List<String> scopes = <String>[
      'email',
      'profile',
    ];

    googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
    _initGoogleSignInExecuted = true;
  }

  static Future<void> initHive() async {
    assert(_initHiveExecuted == false, 'App.initHive() must be called only once');
    if (_initHiveExecuted) return;

    await Hive.initFlutter();
    await Hive.openBox(Boxes.settings);

    _initHiveExecuted = true;
  }

  static Future<void> initSecureStorage() async {
    secureStorage = const FlutterSecureStorage();
  }

  static late final FlutterSecureStorage secureStorage;

  static late final FirebaseRemoteConfig remoteConfig;

  static late final GoogleSignIn googleSignIn;

  static late final FlutterLocalization localization;

  /// Initial locale of the app. To get the current locale, use [localization].
  static late final Locale initLocale;

  static late final PackageInfo packageInfo;
}
