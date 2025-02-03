import 'package:intl/intl.dart' as intl;

import 'texts.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class TextsCs extends Texts {
  TextsCs([String locale = 'cs']) : super(locale);

  @override
  String get about => 'O aplikaci';

  @override
  String aboutCopyRight(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.y(localeName);
    final String timeString = timeDateFormat.format(time);

    return '© 2023 - $timeString Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3';
  }

  @override
  String get account => 'Účet';

  @override
  String get accounts => 'Účty';

  @override
  String get addAccount => 'Přidat účet';

  @override
  String get allergens => 'Alergeny';

  @override
  String get allowPermission => 'Udělit oprávnění';

  @override
  String get amoledMode => 'AMOLED mód';

  @override
  String get amoledModeSubtitle => 'Přidej se k temné straně síly!';

  @override
  String get amoledSubtitle => 'Přidej se k temné straně síly!';

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
  String get appDescription =>
      'Aplikace pro objednávání ze systému Icanteen. Cíl této aplikace je zjednodušit, zrychlit, (případně i zautomatizovat) objednávání obědů.';

  @override
  String appLegalese(DateTime year) {
    final intl.DateFormat yearDateFormat = intl.DateFormat.y(localeName);
    final String yearString = yearDateFormat.format(year);

    return '© 2023 - $yearString Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3';
  }

  @override
  String get appName => 'Autojídelna';

  @override
  String get appearance => 'Vzhled';

  @override
  String get appearence => 'Vzhled';

  @override
  String get burzaAlertDialogContent =>
      'Přidáváte jídlo na burzu. Peníze se Vám vrátí pouze v případě, že si jídlo objedná někdo jiný.';

  @override
  String get calendarBigMarkers => 'Velké ukazatele v kalendáři';

  @override
  String get cancel => 'Zrušit';

  @override
  String get category => 'Kategorie';

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
  String get currency => 'Kč';

  @override
  String get darkThemeMode => 'Tmavý';

  @override
  String get dataCollection => 'Shromažďování údajů';

  @override
  String get dataCollectionAgreement =>
      'Používáním aplikace souhlasíte se zasíláním anonymních dat. ';

  @override
  String get dataCollectionDescription_1 =>
      'Informace shromažďujeme výhradně za účelem oprav chyb v aplikaci a udržování základních statistických údajů. Nemůžeme vyzkoušet autojídelnu u jídelen, kde nemáme přístup, jsme na těchto informacích závislí. Podrobnější informace naleznete ve ';

  @override
  String get dataCollectionDescription_2 => 'Zdrojovém kódu';

  @override
  String get dataCollectionDescription_3 => ' nebo v ';

  @override
  String get dataCollectionDescription_4 => 'Zásadách ochrany osobních údajů.';

  @override
  String get dateFormat => 'Formát dat';

  @override
  String get debug => 'Debug';

  @override
  String get display => 'Zobrazení';

  @override
  String dochazejiciKreditChannelDescription(String username) {
    return 'Oznámení o tom, zda vám dochází kredit týden dopředu pro $username';
  }

  @override
  String get dochazejiciKreditChannelName => 'Docházející kredit';

  @override
  String get dontShowAgain => 'Příště nezobrazovat';

  @override
  String get drinks => 'Pití';

  @override
  String get error => 'Chyba';

  @override
  String get errorsBadConnection =>
      'Nepodařilo se připojit k serveru icanteen. Zkuste to znovu později';

  @override
  String get errorsBadLogin => 'Nesprávné přihlašovací údaje';

  @override
  String get errorsBadPassword => 'Špatné heslo nebo uživatelské jméno';

  @override
  String get errorsBadUrl => 'Nesprávné Url';

  @override
  String get errorsChangelog => 'Nepodařilo se získat změny :/';

  @override
  String get errorsChybaPriDavaniNaBurzu =>
      'Nastala chyba při dávání jídla na burzu';

  @override
  String get errorsChybaPriRuseni => 'Nastala chyba při rušení objednávky';

  @override
  String get errorsDownloadingApp => 'Aktualizace aplikace selhala';

  @override
  String get errorsDownloadingAppDetail =>
      'Při Stahování aplikace došlo k chybě. Ověřte vaše připojení a zkuste znovu.';

  @override
  String get errorsJidloNeniNaBurze => 'Jídlo není na burze';

  @override
  String get errorsLoad => 'Selhalo načítání jídelníčku';

  @override
  String get errorsLoadingData => 'Nastala chyba při načítání dat';

  @override
  String get errorsLoginFailed => 'Přihlašování selhalo';

  @override
  String errorsLoginFailedDetail(String error) {
    return 'Při přihlašování došlo k chybě: $error';
  }

  @override
  String get errorsNelzeObjednat => 'Oběd nelze objednat';

  @override
  String get errorsNelzeObjednatKredit =>
      'Oběd nelze objednat - Nedostatečný kredit.';

  @override
  String get errorsNoInternet => 'Nemáte připojení k internetu';

  @override
  String get errorsObedNelzeZrusit =>
      'Oběd nelze zrušit. Platnost objednávky vypršela.';

  @override
  String get errorsObjednavaniJidla => 'Nastala chyba při objednávání jídla';

  @override
  String get errorsUndefined => 'Nastala Chyba';

  @override
  String get errorsUpdatingData => 'Nastala chyba při aktualizaci dat';

  @override
  String get experimental => 'Experimentální';

  @override
  String get gettingDataNotifications => 'Získávám data pro oznámení';

  @override
  String jidloChannelDescription(String username) {
    return 'Oznámení každý den o tom jaké je dnes jídlo pro $username';
  }

  @override
  String get jidloChannelName => 'Dnešní jídlo';

  @override
  String get language => 'Jazyk';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageEnglish => 'Angličtina';

  @override
  String get licenses => 'Licence';

  @override
  String get lightThemeMode => 'Světlý';

  @override
  String get listUi => 'List UI';

  @override
  String get location => 'Výdejna';

  @override
  String get locationsUnknown => 'Neznámá výdejna';

  @override
  String get login => 'Přihlásit se';

  @override
  String get loginPasswordFieldHint => 'Zadejte prosím své heslo';

  @override
  String get loginPasswordFieldLabel => 'Heslo';

  @override
  String get loginUrlFieldHint =>
      'Zadejte prosím url stránky icanteen - např. jidelna.trebesin.cz';

  @override
  String get loginUrlFieldLabel =>
      'Url stránky icanteen - např. jidelna.trebesin.cz';

  @override
  String get loginUserFieldHint => 'Zadejte prosím své uživatelské jméno';

  @override
  String get loginUserFieldLabel => 'Uživatelské jméno';

  @override
  String get logoutConfirm => 'Odhlásit se';

  @override
  String get logoutUSure => 'Opravdu se chcete odhlásit?';

  @override
  String get mainCourse => 'Hlavní chod';

  @override
  String get menu => 'Jídelníček';

  @override
  String get more => 'Více';

  @override
  String get moreInfo => 'Více informací.';

  @override
  String get name => 'Jméno';

  @override
  String get navigationRailExpantionButtonTitle => 'Menu';

  @override
  String get nedostatekKreditu => 'Nedostatek kreditu';

  @override
  String get nelzeObjednat => 'Nelze objednat';

  @override
  String get nelzeZrusit => 'Nelze zrušit';

  @override
  String get noFood => 'Žádná jídla pro tento den.';

  @override
  String get noThankYou => 'Ne, děkuji';

  @override
  String get notificationDochaziVamKredit => 'Dochází vám kredit!';

  @override
  String notificationKreditPro(String username, String ammount) {
    return 'Kredit pro $username: $ammount Kč';
  }

  @override
  String get notificationObjednejteSi => 'Objednejte si na příští týden';

  @override
  String notificationObjednejteSiDetail(String username) {
    return 'Uživatel $username si stále ještě neobjenal na příští týden';
  }

  @override
  String get notificationZtlumit => 'Ztlumit na týden';

  @override
  String get notifications => 'Oznámení';

  @override
  String notificationsFor(String username) {
    return 'Oznámení pro $username';
  }

  @override
  String objednanoChannelDescription(String username) {
    return 'Oznámení týden dopředu o tom, zda jste si objednal jídlo na příští týden pro $username';
  }

  @override
  String get objednanoChannelName => 'Objednáno?';

  @override
  String get objednat => 'Objednat';

  @override
  String get objednatAction => 'Objednat náhodně';

  @override
  String get objednatZBurzy => 'Objednat z burzy';

  @override
  String get odebratZBurzy => 'Odebrat z burzy';

  @override
  String get ok => 'OK';

  @override
  String get other => 'Ostatní';

  @override
  String get otherDescription => 'Ostatní oznámení, např. chybové hlášky';

  @override
  String get password => 'Heslo';

  @override
  String get patch => 'patch';

  @override
  String get paymentAccountNumber => 'Číslo účtu';

  @override
  String get paymentInfo => 'Platební Údaje';

  @override
  String get personalInfo => 'Osobní Údaje';

  @override
  String get pickLocation => 'Vyberte výdejnu:';

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get requestNotificationPermission => 'Požádat o povolení notifikací';

  @override
  String get settings => 'Nastavení';

  @override
  String get settingsNemateObjednano => 'Nemáte objednáno na příští týden';

  @override
  String settingsNotificationFor(String username) {
    return 'Oznámení pro $username';
  }

  @override
  String get settingsRelativeTimestamps => 'Relativní časové značky';

  @override
  String settingsRelativeTimestampsSub(String date) {
    return '„Dnes“ místo „$date“';
  }

  @override
  String get settingsSkipWeekends => 'Přeskakovat víkendy';

  @override
  String get settingsStopDataCollection =>
      'Zastavit sledování analytických služeb';

  @override
  String get settingsTheme => 'Schéma';

  @override
  String get settingsTitleCredit => 'Nízký credit';

  @override
  String get settingsTitleTodaysFood => 'Dnešní jídlo';

  @override
  String get shareApp => 'Sdílet aplikaci';

  @override
  String get shareDescription => 'Autojídelna (aplikace na objednávání jídla)';

  @override
  String get sideDish => 'Přílohy';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get skipWeekends => 'Přeskakovat víkendy';

  @override
  String get soup => 'Polévka';

  @override
  String get specificSymbol => 'Specifický symbol';

  @override
  String get stable => 'Stable';

  @override
  String get statistics => 'Statistiky';

  @override
  String get stopAnalytics => 'Zastavit sledování analytických služeb';

  @override
  String get systemThemeMode => 'Systém';

  @override
  String get tabletUi => 'Tablet UI';

  @override
  String tabletUiOptions(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'error',
        'auto': 'Automaticky',
        'always': 'Vždy',
        'landscape': 'Na šířku',
        'never': 'Nikdy',
      },
    );
    return '$_temp0';
  }

  @override
  String get theme => 'Schéma';

  @override
  String get themeModeDark => 'Tmavý';

  @override
  String get themeModeLight => 'Světlý';

  @override
  String get themeModeSystem => 'Systém';

  @override
  String get tryAgain => 'Zkusit znovu';

  @override
  String get typeCrash => 'Napište \"crash\" pro pád aplikace';

  @override
  String get variableSymbol => 'Variabilní symbol';

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

  @override
  String get vlozitNaBurzu => 'Vložit na burzu';
}
