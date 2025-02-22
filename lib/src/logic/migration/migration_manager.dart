import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MigrationManager {
  static Future<void> runMigrations() async {
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();

    final String currentVersion = App.packageInfo.version;
    final String? lastKnownVersion = Hive.box(Boxes.appState).get(HiveKeys.appState.lastVersion, defaultValue: '1.0.0');

    if (lastKnownVersion == null || _isNewerVersion(lastKnownVersion, currentVersion)) {
      await _runMigrationScripts(lastKnownVersion, currentVersion);
      Hive.box(Boxes.appState).put(HiveKeys.appState.lastVersion, currentVersion);
    }

    stopwatch.stop();
    Duration elapsed = stopwatch.elapsed;
    debugPrint('Migration took ${elapsed.inMilliseconds} ms');
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
    if (_isNewerVersion(oldVersion, '2.0.0')) {
      await _migrateTo2_0_0();
      oldVersion = '2.0.0';
    }
  }

  static Future<void> _migrateTo2_0_0() async {
    debugPrint('Applying migration for version 2.0.0');

    await Hive.openBox('statistics');
    Box box = Hive.box('statistics');
    int? order = box.get('statistika:objednavka');
    int? autoOrder = box.get('statistika:auto');
    int? burzaCatcher = box.get('statistika:burzaCatcher');

    await Hive.openBox('appState');
    box = Hive.box('appState');
    bool? hideBurzaAlertDialog = box.get('hideBurzaAlertDialog');
    String? lastUsedICanteenUrl = box.get('url');

    // TODO
    box = Hive.box('notifications');
    Map<String, dynamic> notificationsData = {};
    for (String key in box.keys) {
      if (key.startsWith('lastCheck_') ||
          key.startsWith('lastJidloDneCheck_') ||
          key.startsWith('ignore_objednat_') ||
          key.startsWith('ignore_kredit_') ||
          key.startsWith('sendFoodInfo_')) {
        notificationsData[key] = box.get(key);
      }
    }

    box = Hive.box('settings');
    ThemeStyle? themeStyle = box.get('themeStyle');
    ThemeMode? themeMode = box.get('themeMode');
    bool? amoledMode = box.get('amoledMode');
    bool? listUi = box.get('listUi');
    bool? bigCalendarMarkers = box.get('bigCalendarMarkers');
    bool? skipWeekends = box.get('skipWeekends');
    bool? relTimeStamps = box.get('relativeTimeStamps');
    DateFormatOptions? dateFormat = box.get('dateFormat');

    await Hive.deleteFromDisk();

    await Hive.openBox(Boxes.analytics);
    box = Hive.box(Boxes.analytics);
    if (order != null) unawaited(box.put(HiveKeys.analytics.statistikaObjednavka, order));
    if (autoOrder != null) unawaited(box.put(HiveKeys.analytics.statistikaAuto, autoOrder));
    if (burzaCatcher != null) unawaited(box.put(HiveKeys.analytics.statistikaBurzaCatcher, burzaCatcher));

    await Hive.openBox(Boxes.appState);
    box = Hive.box(Boxes.appState);
    if (hideBurzaAlertDialog != null) unawaited(box.put(HiveKeys.appState.hideBurzaAlertDialog, hideBurzaAlertDialog));
    if (lastUsedICanteenUrl != null) unawaited(box.put(HiveKeys.appState.url, lastUsedICanteenUrl));

    // Restore notifications (migrating to account box)
    for (var entry in notificationsData.entries) {
      String key = entry.key;
      dynamic value = entry.value;

      // Extract username and URL from the key
      List<String> splitKey = key.split('_');
      String username = splitKey.reversed.elementAt(1);
      String url = splitKey.last;
      SafeAccount account = SafeAccount(username: username, url: url);

      // Open the correct account box
      await Hive.openBox(Boxes.account(account));
      box = Hive.box(Boxes.account(account));

      // Determine new key format
      String newKey;
      if (key.startsWith('lastCheck_')) {
        newKey = HiveKeys.account.lastNotificationCheck(account);
      } else if (key.startsWith('lastJidloDneCheck_')) {
        newKey = HiveKeys.account.lastJidloDneCheck(account);
      } else if (key.startsWith('ignore_objednat_')) {
        newKey = HiveKeys.account.nemateObjednanoNotifications(account);
      } else if (key.startsWith('ignore_kredit_')) {
        newKey = HiveKeys.account.kreditNotifications(account);
      } else if (key.startsWith('sendFoodInfo_')) {
        newKey = HiveKeys.account.dailyFoodInfo(account);
      } else {
        continue;
      }

      unawaited(box.put(newKey, value));
    }

    await Hive.openBox(Boxes.settings);
    box = Hive.box(Boxes.settings);
    if (themeStyle != null) unawaited(box.put(HiveKeys.settings.themeStyle, themeStyle));
    if (themeMode != null) unawaited(box.put(HiveKeys.settings.themeMode, themeMode));
    if (amoledMode != null) unawaited(box.put(HiveKeys.settings.amoledMode, amoledMode));
    if (listUi != null) unawaited(box.put(HiveKeys.settings.listUi, listUi));
    if (bigCalendarMarkers != null) unawaited(box.put(HiveKeys.settings.bigCalendarMarkers, bigCalendarMarkers));
    if (skipWeekends != null) unawaited(box.put(HiveKeys.settings.skipWeekends, skipWeekends));
    if (relTimeStamps != null) unawaited(box.put(HiveKeys.settings.relTimeStamps, relTimeStamps));
    if (dateFormat != null) unawaited(box.put(HiveKeys.settings.dateFormat, dateFormat));
  }
}
