import 'package:intl/intl.dart' as intl;

import 'texts.dart';

/// The translations for Czech (`cs`).
class TextsCs extends Texts {
  TextsCs([String locale = 'cs']) : super(locale);

  @override
  String get about => 'O aplikaci';

  @override
  String get account => 'Účet';

  @override
  String get accounts => 'Účty';

  @override
  String get addAccount => 'Přidat účet';

  @override
  String get amoledMode => 'AMOLED mód';

  @override
  String get amoledModeSubtitle => 'Přidej se k temné straně síly!';

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
  String appLegalese(DateTime year) {
    final intl.DateFormat yearDateFormat = intl.DateFormat.y(localeName);
    final String yearString = yearDateFormat.format(year);

    return '© 2023 - $yearString Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3';
  }

  @override
  String get calendarBigMarkers => 'Velké ukazatele v kalendáři';

  @override
  String get cancel => 'Zrušit';

  @override
  String get changeAccount => 'Změnit účet';

  @override
  String get convenience => 'Pohodlí';

  @override
  String credit(double ammount) {
    final intl.NumberFormat ammountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String ammountString = ammountNumberFormat.format(ammount);

    return 'Kredit: $ammountString Kč';
  }

  @override
  String get dateFormat => 'Formát dat';

  @override
  String get debug => 'Debug';

  @override
  String get experimental => 'Experimentální';

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
  String get language => 'Jazyk';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageEnglish => 'Angličtina';

  @override
  String get licenses => 'Licence';

  @override
  String get listUi => 'List UI';

  @override
  String get location => 'Výdejna';

  @override
  String get login => 'Přihlásit se';

  @override
  String get menu => 'Jídelníček';

  @override
  String get navigationRailExpantionButtonTitle => 'Menu';

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
  String get pickLocation => 'Vyberte výdejnu:';

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get requestNotificationPermission => 'Požádat o povolení notifikací';

  @override
  String get settings => 'Nastavení';

  @override
  String get shareApp => 'Sdílet aplikaci';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get skipWeekends => 'Přeskakovat víkendy';

  @override
  String get stopAnalytics => 'Zastavit sledování analytických služeb';

  @override
  String get theme => 'Schéma';

  @override
  String get themeModeSystem => 'Systém';

  @override
  String get themeModeLight => 'Světlý';

  @override
  String get themeModeDark => 'Tmavý';

  @override
  String get typeCrash => 'Napište \"crash\" pro pád aplikace';

  @override
  String get version => 'Verze';

  @override
  String versionSubtitle(String arg, String version) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'true': 'Debug',
        'other': 'Stable',
      },
    );
    return '$_temp0 $version';
  }

  @override
  String get view => 'Zobrazení';
}
