import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';

/// Hive boxes. Use these values to open a box.
class Boxes {
  static const String appState = 'appState';
  static const String theme = 'theme';
  static const String settings = 'settings';
  static const String cache = 'cache';
  static const String statistics = 'statistics';
  static const String notifications = 'notifications';
}

/// Hive keys. These are the keys used to store values in Hive.
class HiveKeys {
  static const String remoteConfigValues = 'remoteConfigValues';
  // appState box
  static const String locale = 'locale';
  static const String lastVersion = 'lastVersion';
  static const String firstTime = 'firstTime';
  static const String url = 'url';
  static const String hideBurzaAlertDialog = 'hideBurzaAlertDialog';
  static String location(SafeAccount account) => 'location_${account.username}_${account.url}';

  // theme box
  static const String themeMode = 'themeMode';
  static const String themeStyle = 'themeStyle';
  static const String amoledMode = 'amoledMode';

  // settings box
  static const String shouldAskForNotificationPermission = 'shouldAskForNotificationPermission';
  static const String webNotificationsAccepted = 'webNotificationsAccepted';
  static const String tabletUi = 'tabletUi';
  static const String listUi = 'listUi';
  static const String bigCalendarMarkers = 'bigCalendarMarkers';
  static const String dateFormat = 'dateFormat';
  static const String relTimeStamps = 'relativeTimeStamps';
  static const String skipWeekends = 'skipWeekends';
  static const String todaysFood = 'todaysFood';
  static const String sendTodaysFood = 'sendTodaysFood';
  static const String lowCredit = 'lowCredit';
  static const String weekLongFamine = 'weekLongFamine';
  static const String analytics = 'analytics';

  // notification box
  static String lastNotificationCheck(SafeAccount account) => 'lastCheck_${account.username}_${account.url}';
  static String lastJidloDneCheck(SafeAccount account) => 'lastJidloDneCheck_${account.username}_${account.url}';
  static String nemateObjednanoNotifications(SafeAccount account) => 'ignore_objednat_${account.username}_${account.url}';
  static const String onlyNemateObjednanoNotifications = 'ignore_objednat_';
  static String kreditNotifications(SafeAccount account) => 'ignore_kredit_${account.username}_${account.url}';
  static const String onlykreditNotifications = 'ignore_kredit_';
  static String dailyFoodInfo(SafeAccount account) => 'sendFoodInfo_${account.username}_${account.url}';

  // statistics box
  static const String statistikaObjednavka = 'statistika:objednavka';
  static const String statistikaAuto = 'statistika:auto';
  static const String statistikaBurzaCatcher = 'statistika:burzaCatcher';
}
