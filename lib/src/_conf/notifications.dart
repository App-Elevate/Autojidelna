// Purpose: stores constants used throughout the app.

class NotificationIds {
  static String kreditChannel(String userName, String url) => 'kredit_channel_${userName}_$url';
  static String objednanoChannel(String userName, String url) => 'objednano_channel_${userName}_$url';
  static String dnesniJidloChannel(String userName, String url) => 'jidlo_channel_${userName}_$url';
  static String channelGroup(String userName, String url) => 'channel_group_${userName}_$url';
  static const String channelGroupElse = 'channel_group_else';
  static const String channelElse = 'else_channel';
  static const String payloadUser = 'user';
  static const String payloadIndex = 'index';
  static const String payloadIndexDne = 'indexDne';
  static String objednatButton(String userName, String url) => 'objednat_${userName}_$url';
  static const String onlyObjednatButton = 'objednat_';
}

class Nums {
  static int get switchAccountPanelDuration => 300;
}

class AnalyticsEventIds {
  static const String updateButtonClicked = 'updateButtonClicked';
  static const String oldVer = 'oldVersion';
  static const String newVer = 'newVersion';
  static const String updateDownloaded = 'updateDownloaded';
}

// Strings shown to the user
class NotificationsTexts {
  /// initAwesome and notifications in general have a problem with the localization package so we just force czech
  static String notificationsFor(String user) => 'Notifikace pro $user';
  static const String jidloChannelName = 'Dnešní jídlo';
  static String jidloChannelDescription(String user) => 'Notifikace každý den o tom jaké je dnes jídlo pro $user';
  static const String dochazejiciKreditChannelName = 'Docházející kredit';
  static String dochazejiciKreditChannelDescription(String user) => 'Notifikace o tom, zda vám dochází kredit týden dopředu pro $user';
  static const String objednanoChannelName = 'Objednáno?';
  static String objednanoChannelDescription(String user) => 'Notifikace každý den o tom jaké je dnes jídlo pro $user';
  static const String notificationOther = 'Ostatní';
  static const String notificationOtherDescription = 'Ostatní notifikace, např. chybové hlášky...';
  static const String stringtingDataNotifications = 'Získávám data pro notifikace';
  static const String notificationDochaziVamKredit = 'Dochází vám kredit!';
  static String notificationKreditPro(String jmeno, String prijmeni, int kredit) => 'Kredit pro $jmeno $prijmeni: $kredit Kč';
  static const String notificationZtlumit = 'Ztlumit na týden';
  static const String notificationObjednejteSi = 'Objednejte si na příští týden';
  static String notificationObjednejteSiDetail(String jmeno, String prijmeni) => 'Uživatel $jmeno $prijmeni si stále ještě neobjenal na příští týden';
  static const String objednatAction = 'Objednat náhodně';
  static const String notificationNoFood = 'Žádná jídla pro tento den';
  static const String nastalaChyba = 'Nastala chyba';
}

class Links {
  static const String autojidelna = 'https://autojidelna.cz';
  static const String repo = 'https://github.com/App-Elevate/AUT.aplikace';
  static const String latestVersionApi = 'https://api.github.com/repos/App-Elevate/AUT.aplikace/releases/latest';
  static const String appStore = '$autojidelna/release/appStore.json';
  static String currentVersionCode(String appVersion) => '$repo/blob/v$appVersion';

  static const String privacyPolicy = '$autojidelna/cs/privacy-policy/';
  static String currentChangelog(String version) => '$autojidelna/cs/changelogs/#$version';

  static const String latestRelease = '$repo/releases/latest';
  static const String email = 'info@appelevate.cz';
}

class Assets {
  static const String logo = 'assets/images/logo.svg';
}
