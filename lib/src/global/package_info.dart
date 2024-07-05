import 'package:package_info_plus/package_info_plus.dart';

class App {
  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static late final PackageInfo packageInfo;
}
