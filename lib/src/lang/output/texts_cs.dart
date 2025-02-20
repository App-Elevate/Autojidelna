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
  String get errorsAccountNotFound => 'Účet nenalezen';

  @override
  String get errorsAccountNotFoundSubtitle =>
      'Jste si jistí, že existujete? Přihlaste se ručně.';

  @override
  String get errorsAddingToMarketplace => 'Chyba při dávání jídla na burzu';

  @override
  String get errorsAddingToMarketplaceSubtitle =>
      'Něco se pokazilo, zkuste to znovu.';

  @override
  String get errorsCancelingOrder => 'Chyba při rušení objednávky';

  @override
  String get errorsCancelingOrderSubtitle => 'Objednávku se nepodařilo zrušit.';

  @override
  String get errorsConnectionFailed => 'Server si dal pauzu';

  @override
  String get errorsConnectionFailedSubtitle =>
      'Zkuste to později, možná si jen dává kafe.';

  @override
  String get errorsDishCancellationExpired => 'Objednávku nelze zrušit';

  @override
  String get errorsDishCancellationExpiredSubtitle =>
      'Platnost objednávky vypršela, není už možné ji zrušit.';

  @override
  String get errorsDishCannotBeOrdered => 'Oběd nelze objednat';

  @override
  String get errorsDishCannotBeOrderedSubtitle =>
      'Momentálně to není možné. Zkuste to za chvíli.';

  @override
  String get errorsDishNotInMarketplace => 'Jídlo není na burze';

  @override
  String get errorsDishNotInMarketplaceSubtitle =>
      'Možná jste si vybrali něco, co tam už není. Zkuste jinou možnost.';

  @override
  String get errorsDishOrdering => 'Chyba při objednávání jídla';

  @override
  String get errorsDishOrderingSubtitle =>
      'Něco se pokazilo při odesílání vaší objednávky. Zkuste to znovu.';

  @override
  String get errorsGotInternetConnection => 'Jste zpět online!';

  @override
  String get errorsGotInternetConnectionSubtitle =>
      'Síť je v pořádku. Pokračujeme!';

  @override
  String get errorsInsufficientCredit => 'Nedostatečný kredit';

  @override
  String get errorsInsufficientCreditSubtitle =>
      'Chcete-li objednat, přidejte kredit. Bez něj to nepůjde.';

  @override
  String get errorsLoadingData => 'Nastala chyba při načítání dat';

  @override
  String get errorsMenuLoadingFailed => 'Chyba při načítání jídelníčku';

  @override
  String get errorsMenuLoadingFailedSubtitle =>
      'Něco se zadrhlo při načítání nabídky. Zkuste to později.';

  @override
  String get errorsNoInternetConnection => 'Žádné připojení k internetu';

  @override
  String get errorsNoInternetConnectionSubtitle =>
      'Kontrolujeme síť... ujistěte se, že jste online.';

  @override
  String get errorsWrongCredentials => 'Špatné údaje, špatný den?';

  @override
  String get errorsWrongCredentialsSubtitle =>
      'Zkuste to znovu – nebo si je změňte.';

  @override
  String get errorsWrongCredentialsTextField =>
      'Přihlašovací údaje jsou nesprávné.';

  @override
  String get errorsWrongUrl => 'Špatná adresa';

  @override
  String get errorsWrongUrlSubtitle =>
      'Tahle cesta nikam nevede. Zkontrolujte adresu.';

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
  String get loginPasswordFieldHint => 'Zadejte heslo';

  @override
  String get loginPasswordFieldLabel => 'Heslo';

  @override
  String get loginSuccess => 'Přihlášení úspěšné!';

  @override
  String loginSuccessSubtitle(String username) {
    return 'Vítejte zpět, $username!';
  }

  @override
  String get loginUrlFieldHint => 'Zadejte adresu stránky icanteen';

  @override
  String get loginUrlFieldLabel => 'Adresa stránky icanteen';

  @override
  String get loginUserFieldHint => 'Zadejte uživatelské jméno';

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
  String get moreInfo => 'Více informací';

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
  String get pickLocation => 'Vyberte výdejnu';

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
  String get allowAnalytics => 'Povolit analytické služby';

  @override
  String get allowAnalyticsSubtitle =>
      'Odesílejte anonymizované údaje o používání ke zlepšení aplikace';

  @override
  String get sendCrashLogs => 'Odesílat crash logy';

  @override
  String get sendCrashLogsSubtitle =>
      'Odesílejte anonymizovaných crash logů vývojářům';

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

  @override
  String get welcome => 'Vítejte!';

  @override
  String get onboardingSubtitle =>
      'Pojďme nastavit nějaké věci. Později je můžete změnit v nastavení.';

  @override
  String get allowNotifications => 'Povolit oznámení';

  @override
  String get allowNotifcitaionsReasons =>
      'Dáme vám vědět o důležitých informacích, jako je nízký kredit nebo připomenutí objednávky.';

  @override
  String get grant => 'Udělit';

  @override
  String get next => 'Další';

  @override
  String get getStarted => 'Začínáme';

  @override
  String get loginSubtitle =>
      'Přihlaste se a můžeme začít. Užijte si všechny funkce aplikace!';
}
