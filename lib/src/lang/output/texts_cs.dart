import 'package:intl/intl.dart' as intl;

import 'texts.dart';

/// The translations for Czech (`cs`).
class TextsCs extends Texts {
  TextsCs([String locale = 'cs']) : super(locale);

  @override
  String get about => 'O aplikaci';

  @override
  String get analytics => 'Shromažďování údajů';

  @override
  String get analyticsDescription_1 =>
      'Informace shromažďujeme výhradně za účelem oprav chyb v aplikaci a udržování základních statistických údajů. Nemůžeme vyzkoušet autojídelnu u jídelen, kde nemáme přístup, jsme na těchto informacích závislí. Podrobnější informace naleznete ve ';

  @override
  String get analyticsDescription_2 => 'Zdrojovém kódu';

  @override
  String get analyticsDescription_3 => ' nebo v ';

  @override
  String get analyticsDescription_4 => 'Zásadách ochrany osobních údajů.';

  @override
  String get appName => 'Autojídelna';

  @override
  String get appDescription =>
      'Aplikace pro objednávání ze systému Icanteen. Cíl této aplikace je zjednodušit, zrychlit, (případně i zautomatizovat) objednávání obědů.';

  @override
  String get appearance => 'Vzhled';

  @override
  String get cancel => 'Zrušit';

  @override
  String get convenience => 'Pohodlí';

  @override
  String get dateFormat => 'Formát dat';

  @override
  String get gettingDataNotifications => 'Získávám data pro oznámení';

  @override
  String internetConnectionState(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Odpojeno od internetu',
        'true': 'Připojeno k internetu',
      },
    );
    return '$_temp0';
  }

  @override
  String get debug => 'Debug';

  @override
  String get language => 'Jazyk';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageEnglish => 'Angličtina';

  @override
  String get login => 'Přihlásit se';

  @override
  String get menu => 'Jídelníček';

  @override
  String get more => 'Více';

  @override
  String get noFood => 'Žádná jídla pro tento den.';

  @override
  String get noThankYou => 'Ne, děkuji';

  @override
  String get notifications => 'Oznámení';

  @override
  String get orders => 'Objednávky';

  @override
  String get password => 'Heslo';

  @override
  String get patch => 'patch';

  @override
  String get requestNotificationPermission => 'Požádat o povolení notifikací';

  @override
  String get settings => 'Nastavení';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get stopAnalytics => 'Zastavit sledování analytických služeb';

  @override
  String get themeModeSystem => 'Systém';

  @override
  String get themeModeLight => 'Světlý';

  @override
  String get themeModeDark => 'Tmavý';

  @override
  String get typeCrash => 'Napište \"crash\" pro pád aplikace';
}
