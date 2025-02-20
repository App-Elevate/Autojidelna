// Purpose: stores constants used throughout the app.

import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';

class NotificationIds {
  static String kreditChannel(SafeAccount account) => 'kredit_channel_${account.username}_${account.url}';
  static String objednanoChannel(SafeAccount account) => 'objednano_channel_${account.username}_${account.url}';
  static String dnesniJidloChannel(SafeAccount account) => 'jidlo_channel_${account.username}_${account.url}';
  static String channelGroup(SafeAccount account) => 'channel_group_${account.username}_${account.url}';
  static String get channelGroupElse => 'channel_group_else';
  static String get channelElse => 'else_channel';
  static String get payloadUser => 'user';
  static String get payloadIndex => 'index';
  static String get payloadIndexDne => 'indexDne';
  static String objednatButton(SafeAccount account) => 'objednat_${account.username}_${account.url}';
  static String get onlyObjednatButton => 'objednat_';
}

// Strings shown to the user
class NotificationsTexts {
  /// initAwesome and notifications in general have a problem with the localization package so we just force czech
  static String notificationsFor(String user) => 'Notifikace pro $user';
  static String get jidloChannelName => 'Dnešní jídlo';
  static String jidloChannelDescription(String user) => 'Notifikace každý den o tom jaké je dnes jídlo pro $user';
  static String get dochazejiciKreditChannelName => 'Docházející kredit';
  static String dochazejiciKreditChannelDescription(String user) => 'Notifikace o tom, zda vám dochází kredit týden dopředu pro $user';
  static String get objednanoChannelName => 'Objednáno?';
  static String objednanoChannelDescription(String user) => 'Notifikace každý den o tom jaké je dnes jídlo pro $user';
  static String get notificationOther => 'Ostatní';
  static String get notificationOtherDescription => 'Ostatní notifikace, např. chybové hlášky...';
  static String get gettingDataNotifications => 'Získávám data pro notifikace';
  static String get notificationDochaziVamKredit => 'Dochází vám kredit!';
  static String notificationKreditPro(String jmeno, String prijmeni, int kredit) => 'Kredit pro $jmeno $prijmeni: $kredit Kč';
  static String get notificationZtlumit => 'Ztlumit na týden';
  static String get notificationObjednejteSi => 'Objednejte si na příští týden';
  static String notificationObjednejteSiDetail(String jmeno, String prijmeni) => 'Uživatel $jmeno $prijmeni si stále ještě neobjenal na příští týden';
  static String get objednatAction => 'Objednat náhodně';
  static String get notificationNoFood => 'Žádná jídla pro tento den';
  static String get nastalaChyba => 'Nastala chyba';
}

class Links {
  static String get autojidelna => 'https://autojidelna.cz';
  static String get repo => 'https://github.com/App-Elevate/Autojidelna';
  static String get currentVersionCode => '$repo/blob/v${App.packageInfo.version}';

  static String get privacyPolicy => '$autojidelna/cs/privacy-policy/';
  static String get email => 'info@appelevate.cz';
}
