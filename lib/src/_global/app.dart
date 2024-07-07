import 'package:coree/src/_conf/hive.dart';
import 'package:coree/src/_global/remote_config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class App {
  static bool _initPlatformExecuted = false;
  static bool _initLocalizationExecuted = false;
  static bool _initRemoteConfigExecuted = false;
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
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(milliseconds: 400),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await remoteConfig.setDefaults(Rmc.defaultValues);

    _initRemoteConfigExecuted = true;
  }

  static late final FirebaseRemoteConfig remoteConfig;

  static late final FlutterLocalization localization;

  /// Initial locale of the app. To get the current locale, use [localization].
  static late final Locale initLocale;

  static late final PackageInfo packageInfo;
}

class AppOnline {
  static bool _initOnlineExecuted = false;
  static Future<void> initOnline() async {
    assert(_initOnlineExecuted == false, 'AppOnline.initOnline() must be called only once');
    if (_initOnlineExecuted) return;

    //await App.remoteConfig.fetchAndActivate();
    //initRemoteConfigValues = App.remoteConfig.getAll();

    _initOnlineExecuted = true;
  }

  /// Initial Remote Config Values of the app. To get the current values, use provider [Rmc].
  static Map<String, dynamic>? initRemoteConfigValues;
}
