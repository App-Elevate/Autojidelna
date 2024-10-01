import 'package:autojidelna/src/_conf/adapters.hive.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/_global/providers/remote_config.dart';
import 'package:autojidelna/src/lang/supported_locales.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/logic/notifications.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:background_fetch/background_fetch.dart';
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
  static bool _initNotificationsExecuted = false;

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

  static Future<void> initNotifications() async {
    assert(_initNotificationsExecuted == false, 'App.initNotifications() must be called only once');
    if (_initNotificationsExecuted) return;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String? lastVersion = Hive.box(Boxes.appState).get(HiveKeys.lastVersion);

    // Removing the already set notifications if we updated versions
    if (lastVersion != version) {
      // Set the new version
      Hive.box(Boxes.appState).put(HiveKeys.lastVersion, version);

      try {
        LoginDataAutojidelna loginData = await loggedInCanteen.getLoginDataFromSecureStorage();

        for (LoggedInUser uzivatel in loginData.users) {
          AwesomeNotifications().removeChannel(NotificationIds.kreditChannel(uzivatel.username, uzivatel.url));
          await AwesomeNotifications().removeChannel(NotificationIds.objednanoChannel(uzivatel.username, uzivatel.url));
        }
      } catch (e) {
        //do nothing
      }
      await AwesomeNotifications().dispose();
    }

    // Initialize the notifications
    initAwesome();

    // Setting listeners for when the app is running and notification button is clicked
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );

    // Detecting if the app was opened from a notification and handling it if it was
    ReceivedAction? receivedAction = await AwesomeNotifications().getInitialNotificationAction(removeFromActionEvents: false);
    await NotificationController.handleNotificationAction(receivedAction);

    // Initializing the background fetch
    BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
    _initNotificationsExecuted = true;
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
    Hive.registerAdapter(ThemeModeAdapter());
    Hive.registerAdapter(ThemeStyleAdapter());
    Hive.registerAdapter(DateFormatOptionsAdapter());
    await Hive.openBox(Boxes.theme);
    await Hive.openBox(Boxes.settings);
    await Hive.openBox(Boxes.cache);
    await Hive.openBox(Boxes.appState);
    await Hive.openBox(Boxes.statistics);
    await Hive.openBox(Boxes.notifications);

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

  static final defaultLocale = Locales.cs;

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
