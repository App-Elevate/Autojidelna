import 'package:coree/src/_conf/hive.dart';
import 'package:coree/src/_messaging/exponential_backoff.dart';
import 'package:coree/src/_messaging/messaging.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
/// Package info: [packageInfo]
///
/// Secure storage: [secureStorage]
class App {
  static bool _initPlatformExecuted = false;
  static bool _initLocalizationExecuted = false;
  static bool _initRemoteConfigExecuted = false;
  static bool _initGoogleSignInExecuted = false;
  static bool _initHiveExecuted = false;
  static bool _initAppCheckExecuted = false;
  static bool _initFirebaseMessagingExecuted = false;
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

  static Future<void> initAppCheck() async {
    assert(_initAppCheckExecuted == false, 'App.initAppCheck() must be called only once');
    if (_initAppCheckExecuted) return;

    retryWithExponentialBackoff(
      () async => await FirebaseAppCheck.instance.activate(
        // this is also an option: ReCaptchaV3Provider('6LdNRA0qAAAAABvSy9wAVVjdlhcbuXTasRoK6Z4h')
        webProvider: ReCaptchaEnterpriseProvider('6LcZHQ0qAAAAAMDHZjUfWBOkvKR_eqxFixd7WeR7'),
        androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
        appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttestWithDeviceCheckFallback,
      ),
      exitAfterFirstTryCallback: (_) => null,
      infinite: true,
    );

    _initAppCheckExecuted = true;
  }

  static Future<void> initFirebaseMessaging() async {
    assert(_initFirebaseMessagingExecuted == false, 'App.initFirebaseMessaging() must be called only once');
    if (_initFirebaseMessagingExecuted) return;
    NotificationSettings settings = await FirebaseMessaging.instance.getNotificationSettings();
    await Messaging.setupInteractedMessage();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(Messaging.handleMessage);

    if (settings.authorizationStatus == AuthorizationStatus.notDetermined &&
        Hive.box(Boxes.settings).get(HiveKeys.shouldAskForNotificationPermission, defaultValue: true)) {
      App.shouldAskForNotification = true;
    } else {
      App.shouldAskForNotification = false;
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized || settings.authorizationStatus == AuthorizationStatus.provisional) {
      await Messaging.onNotificationPermissionGranted();
    }

    _initFirebaseMessagingExecuted = true;
  }

  static late final FlutterSecureStorage secureStorage;

  static late final FirebaseRemoteConfig remoteConfig;

  static late final GoogleSignIn googleSignIn;

  static late Locale currentLocale;

  static late final PackageInfo packageInfo;

  static late final bool shouldAskForNotification;

  static const defaultLocale = Locale('en');

  /// This function is used to change the language of the app.
  ///
  /// You can also pass null to this function to to translate to the default language.
  ///
  /// Do not call this before MaterialApp is built.
  static late Function(Locale? language) translate;
}
