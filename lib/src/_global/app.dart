import 'package:coree/src/_conf/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class App {
  static bool _initPlatformExecuted = false;
  static bool _initLocalizationExecuted = false;
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

  static late final FlutterLocalization localization;

  /// Initial locale of the app. To get the current locale, use [localization].
  static late final Locale initLocale;

  static late final PackageInfo packageInfo;
}
