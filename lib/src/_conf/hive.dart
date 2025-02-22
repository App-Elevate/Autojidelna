import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';

/// Hive boxes. Use these values to open a box.
class Boxes {
  static const String appState = 'appState';
  static const String settings = 'settings';
  static const String analytics = 'analytics';
  static const String notifications = 'notifications';

  /// Box used to store everything related to an account
  static String account(SafeAccount account) => 'account_${account.username}_${account.url}';
}

/// Hive keys. These are the keys used to store values in Hive.
class HiveKeys {
  // appState box
  static const String locale = 'locale';
  static const String lastVersion = 'last_version';
  static const String firstTime = 'first_time';
  static const String url = 'last_used_icanteen_url';
  static const String hideBurzaAlertDialog = 'hide_burza_alert_dialog';
  static const String remoteConfigValues = 'remote_config_values';

  // user box
  static String location(SafeAccount account) => 'location_${account.username}_${account.url}';
  static String lastNotificationCheck(SafeAccount account) => 'last_check_${account.username}_${account.url}';
  static String lastJidloDneCheck(SafeAccount account) => 'last_jidlo_dne_check_${account.username}_${account.url}';
  static String nemateObjednanoNotifications(SafeAccount account) => 'ignore_objednat_${account.username}_${account.url}';
  static String dailyFoodInfo(SafeAccount account) => 'send_dish_info_${account.username}_${account.url}';
  static String kreditNotifications(SafeAccount account) => 'ignore_kredit_${account.username}_${account.url}';

  // settings box
  static const String themeMode = 'theme_mode';
  static const String themeStyle = 'theme_style';
  static const String amoledMode = 'amoled_mode';
  static const String listUi = 'list_ui';
  static const String bigCalendarMarkers = 'big_calendar_markers';
  static const String dateFormat = 'date_format';
  static const String relTimeStamps = 'relative_time_stamps';
  static const String skipWeekends = 'skip_weekends';

  // notification box
  static const String onlyNemateObjednanoNotifications = 'ignore_objednat_';
  static const String onlykreditNotifications = 'ignore_kredit_';

  // analytics box
  static const String statistikaObjednavka = 'order';
  static const String statistikaAuto = 'auto_order';
  static const String statistikaBurzaCatcher = 'burza_catcher';
  static const String allowAnalytics = 'allow_analytics';
  static const String sendCrashLogs = 'send_crash_logs';
}
