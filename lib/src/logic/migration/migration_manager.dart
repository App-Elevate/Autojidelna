import 'package:autojidelna/src/_conf/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MigrationManager {
  //static final Box _appStatebox = Hive.box(Boxes.appState);
  static final Box _settingsBox = Hive.box(Boxes.settings);
  //static final Box _themeBox = Hive.box(Boxes.theme);
  //static final Box _notificationBox = Hive.box(Boxes.notifications);
  //static final Box _statisticsBox = Hive.box(Boxes.statistics);

  static Future<void> runMigrations() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String currentVersion = packageInfo.version;
    final String? lastKnownVersion = _settingsBox.get(HiveKeys.lastVersion) as String?;

    if (lastKnownVersion == null || _isNewerVersion(lastKnownVersion, currentVersion)) {
      await _runMigrationScripts(lastKnownVersion, currentVersion);
      _settingsBox.put(HiveKeys.lastVersion, currentVersion); // Update stored version
    }
  }

  static bool _isNewerVersion(String oldVersion, String newVersion) {
    List<int> oldParts = oldVersion.split('.').map(int.parse).toList();
    List<int> newParts = newVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < newParts.length; i++) {
      if (i >= oldParts.length || newParts[i] > oldParts[i]) return true;
      if (newParts[i] < oldParts[i]) return false;
    }
    return false;
  }

  static Future<void> _runMigrationScripts(String? oldVersion, String newVersion) async {
    debugPrint('Running migrations from $oldVersion to $newVersion');

    // First time user
    if (oldVersion == null) return;

    // Add new migrations here
    // TODO: migration for full release
    if (_isNewerVersion(oldVersion, '2.0.0')) {
      await _migrateTo2_0_0();
    }
  }

  static Future<void> _migrateTo2_0_0() async {
    debugPrint('Applying migration for version 2.0.0');
  }
}
