import 'package:flutter_localization/flutter_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';

class App {
  static bool executed = false;
  static Future<void> init() async {
    assert(executed == false, 'App.init() must be called only once');
    if (executed) return;
    localization = FlutterLocalization.instance;
    packageInfo = await PackageInfo.fromPlatform();
  }

  static late final FlutterLocalization localization;

  static late final PackageInfo packageInfo;
}
