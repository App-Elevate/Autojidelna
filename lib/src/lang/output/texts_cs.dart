import 'package:intl/intl.dart' as intl;

import 'texts.dart';

/// The translations for Czech (`cs`).
class TextsCs extends Texts {
  TextsCs([String locale = 'cs']) : super(locale);

  @override
  String get about => 'O aplikaci';

  @override
  String get aboutCheckForUpdates => 'Zkontrolovat aktualizace';

  @override
  String aboutCopyRight(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.y(localeName);
    final String timeString = timeDateFormat.format(time);

    return '© 2023 - $timeString Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3';
  }

  @override
  String get aboutLatestVersion =>
      'Aktuálně jste na nejnovější verzi aplikace 👍';

  @override
  String get aboutSourceCode => 'Zdrojový kód';

  @override
  String aboutVersionSubtitle(String arg, String version) {
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
  String get account => 'Účet';

  @override
  String get accountStatus => 'Stav účtu';

  @override
  String accountcreationTime(Object date) {
    return 'Čas vytvoření účtu: $date';
  }

  @override
  String get addAccount => 'Přidat účet';

  @override
  String get allergens => 'Alergeny';

  @override
  String get allowPermission => 'Udělit oprávnění';

  @override
  String get appDescription =>
      'Aplikace pro objednávání ze systému Icanteen. Cíl této aplikace je zjednodušit, zrychlit, (případně i zautomatizovat) objednávání obědů.';

  @override
  String get appName => 'Autojídelna';

  @override
  String get burzaAlertDialogContent =>
      'Přidáváte jídlo na burzu. Peníze se Vám vrátí pouze v případě, že si jídlo objedná někdo jiný.';

  @override
  String get buttonPushed => 'Tlačítko jste stiskli tolikrát:';

  @override
  String get cancel => 'Zrušit';

  @override
  String get category => 'Kategorie';

  @override
  String get changeAccount => 'Změnit účet';

  @override
  String get connectedToANetwork => 'Připojeno k síti';

  @override
  String get connectedToTheInternet => 'Připojeno k internetu';

  @override
  String get convenience => 'Pohodlí';

  @override
  String get counting => 'Počítání';

  @override
  String get crashlytics => 'Crashlytics';

  @override
  String get crashlyticsPage => 'Stránka Crashlytics';

  @override
  String get crashlyticsTestCrash => 'Testovací pád Crashlytics yohooo!';

  @override
  String get createAccount => 'Vytvořit účet s e-mailem a heslem';

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
  String get dataCollectionAgreement =>
      'Používáním aplikace souhlasíte se zasíláním anonymních dat. ';

  @override
  String get dateFormat => 'Formát dat';

  @override
  String get debug => 'Debug';

  @override
  String get deleteAccount => 'Smazat účet';

  @override
  String get deleteAccountConfirm => 'Smazat účet';

  @override
  String get deleteAccountDialog => 'Opravdu chcete smazat svůj účet?';

  @override
  String get demoPageTitle => 'Demo stránka';

  @override
  String get disconnectedFromANetwork => 'Odpojeno od sítě';

  @override
  String get disconnectedFromTheInternet => 'Odpojeno od internetu';

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
  String get email => 'E-mail';

  @override
  String get enterAValidEmailAddress => 'Zadejte platnou e-mailovou adresu';

  @override
  String get enterYourEmail => 'Zadejte svůj e-mail';

  @override
  String get enterYourPassword => 'Zadejte své heslo';

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
  String get errorsLoginFailed => 'Přihlášení se nezdařilo';

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
  String get gettingDataNotifications => 'Získávám data pro oznámení';

  @override
  String get goBack => 'Jít zpět';

  @override
  String get goToSettings => 'Jít na nastavení';

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
  String get languageName => 'Čeština';

  @override
  String lastSignInTime(Object date) {
    return 'Čas posledního přihlášení: $date';
  }

  @override
  String get licenses => 'Licence';

  @override
  String get lightThemeMode => 'Světlý';

  @override
  String get listUi => 'List UI';

  @override
  String get localization => 'Lokalizace';

  @override
  String get location => 'Výdejna';

  @override
  String get locationsUnknown => 'Neznámá výdejna';

  @override
  String loggedIn(Object bool) {
    return 'Přihlášen: $bool';
  }

  @override
  String get login => 'přihlásit se';

  @override
  String get loginButton => 'Přihlásit se';

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
  String get nedostatekKreditu => 'Nedostatek kreditu';

  @override
  String get neededPermission => 'Potřebné oprávnění';

  @override
  String get neededPermissionDescription_1 =>
      'Pro automatickou instalaci aktualizace je potřeba povolit oprávnění pro instalaci aplikací z neznámých zdrojů.';

  @override
  String get neededPermissionDescription_2 => 'Ta může vypadat takto:';

  @override
  String get neededPermissionDescription_3 =>
      'Toto oprávnění používáme pouze k aktualizaci aplikace. Pokud si nepřejete oprávnění povolit můžete stále stáhnout apk z githubu.';

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
  String notificationKreditPro(String first, String last, String ammount) {
    return 'Kredit pro $first $last: $ammount Kč';
  }

  @override
  String get notificationObjednejteSi => 'Objednejte si na příští týden';

  @override
  String notificationObjednejteSiDetail(
      String first, String last, Object fist) {
    return 'Uživatel $fist $last si stále ještě neobjenal na příští týden';
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
  String get orders => 'Objednávky';

  @override
  String ordersWithAutojidelna(int ammount) {
    return 'Objednávky s Autojídelnou: $ammount';
  }

  @override
  String get other => 'Ostatní';

  @override
  String get otherDescription => 'Ostatní oznámení, např. chybové hlášky';

  @override
  String get password => 'Heslo';

  @override
  String get passwordMustBeAtLeast6CharactersLong =>
      'Heslo musí mít alespoň 6 znaků';

  @override
  String get patch => 'patch';

  @override
  String get paymentAccountNumber => 'Číslo účtu';

  @override
  String get paymentInfo => 'Platební Údaje';

  @override
  String get personalInfo => 'Osobní Údaje';

  @override
  String get pickLocation => 'Vyberte výdejnu ';

  @override
  String get popupChangelogNotAvailable => 'Changelog není k dispozici';

  @override
  String get popupNewUpdateInfo => 'Nová verze přináší: ';

  @override
  String popupNewVersionAvailable(String version) {
    return 'Nová verze aplikace - $version';
  }

  @override
  String get popupNotNow => 'Teď ne';

  @override
  String get popupShowOnGithub => 'Zobrazit na Githubu';

  @override
  String get popupUpdate => 'Aktualizovat';

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String providerId(Object id) {
    return 'ID poskytovatele: $id';
  }

  @override
  String get remoteConfig => 'Vzdálená konfigurace';

  @override
  String get requestNotificationPermission => 'Požádat o povolení notifikací';

  @override
  String get resetPassword => 'Obnovit heslo';

  @override
  String get routingGoToDetailDetail => 'Jít na podrobnosti podrobností';

  @override
  String get routingGoToDetailPage => 'Jít na podrobnosti stránky';

  @override
  String get routingGoToParamDetailPage =>
      'Jít na podrobnosti stránky s parametry';

  @override
  String get routingParamDetailPageDetail =>
      'Stránka s podrobnostmi o parametrech směrování';

  @override
  String get routingParamDetailPageDetail1 =>
      'Toto je stránka s podrobnostmi o parametrech směrování.';

  @override
  String get routingParamDetailPageDetail2 =>
      'Slouží k testování směrování s parametry.';

  @override
  String routingParamDetailPageDetail3(Object filmId) {
    return 'Film ID: $filmId';
  }

  @override
  String get routingParamFilmId => 'Cesta param Film ID';

  @override
  String get routingParamPage => 'Stránka s parametry směrování';

  @override
  String get routingParamPageDetail => 'Toto je stránka s parametry směrování.';

  @override
  String get routingParamPageDetail2 =>
      'Slouží k testování směrování s parametry.';

  @override
  String get routingParamQueryFilmId => 'Dotaz param Film ID';

  @override
  String get routingTestDetailDetail => 'Podrobnosti o testování směrování';

  @override
  String get routingTestDetailDetailText =>
      'Toto je podostránka s podrobnostmi o testování směrování.';

  @override
  String get routingTestPage => 'Nastavení';

  @override
  String get routingTestPageDetail => 'Toto je stránka s testováním směrování.';

  @override
  String get routingTestPageDetail1 => 'Slouží k testování směrování.';

  @override
  String get secret => 'tajemství';

  @override
  String get secretPage => 'Tajná stránka';

  @override
  String get settings => 'Nastavení';

  @override
  String get settingsAmoled => 'AMOLED mód';

  @override
  String get settingsAmoledSub => 'Přidej se k temné straně síly!';

  @override
  String get settingsAnotherOptions => 'Další možnosti v nastavení systému...';

  @override
  String get settingsAppearence => 'Vzhled';

  @override
  String get settingsCalendarBigMarkers => 'Velké ukazatele v kalendáři';

  @override
  String get settingsDataCollection => 'Shromažďování údajů';

  @override
  String get settingsDataCollectionDescription_1 =>
      'Informace shromažďujeme výhradně za účelem oprav chyb v aplikaci a udržování základních statistických údajů. Nemůžeme vyzkoušet autojídelnu u jídelen, kde nemáme přístup, jsme na těchto informacích závislí. Podrobnější informace naleznete ve ';

  @override
  String get settingsDataCollectionDescription_2 => 'Zdrojovém kódu';

  @override
  String get settingsDataCollectionDescription_3 => ' nebo v ';

  @override
  String get settingsDataCollectionDescription_4 =>
      'Zásadách ochrany osobních údajů.';

  @override
  String get settingsDebugForceNotifications => 'Force send notifications';

  @override
  String get settingsDebugNotifications => 'Send Notifications';

  @override
  String get settingsDebugOptions => 'Debug Options';

  @override
  String get settingsDisplay => 'Zobrazení';

  @override
  String get settingsNemateObjednano => 'Nemáte objednáno na příští týden';

  @override
  String settingsNotificationFor(String username) {
    return 'Oznámení pro $username';
  }

  @override
  String get settingsNotificationTime => 'Čas oznámení: ';

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
  String get showLocale => 'Zobrazit lokalizaci';

  @override
  String get sideDish => 'Přílohy';

  @override
  String get signInAnonymously => 'Přihlásit se anonymně';

  @override
  String get signInWithApple => 'Přihlásit se pomocí Apple';

  @override
  String get signInWithEmailAndPassword =>
      'Přihlásit se pomocí e-mailu a hesla';

  @override
  String get signInWithGoogle => 'Přihlásit se pomocí Google';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get soup => 'Polévka';

  @override
  String get specificSymbol => 'Specifický symbol';

  @override
  String get stable => 'Stable';

  @override
  String get statistics => 'Statistiky';

  @override
  String get switchAccountPanelTitle => 'Účty';

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
  String get toastExit => 'Zmáčkněte tlačítko zpět pro ukončení aplikace';

  @override
  String get tryAgain => 'Zkusit znovu';

  @override
  String get typeCrash => 'Napište \"crash\" pro pád aplikace';

  @override
  String get updateSnackbarDownloaded =>
      'Aktualizace byla stažena, instalování';

  @override
  String updateSnackbarDownloading(int value) {
    return 'Nová Aktualizace se stahuje - $value%';
  }

  @override
  String get updateSnackbarError =>
      'Došlo k chybě při stahování. Ověřte připojení a zkuste to znovu';

  @override
  String get updateSnackbarWaiting => 'Aktualizace - Čeká se na oprávnění';

  @override
  String userDisplayName(Object name) {
    return 'Zobrazované jméno uživatele: $name';
  }

  @override
  String userEmail(Object email) {
    return 'E-mail uživatele: $email';
  }

  @override
  String userEmailVerified(Object bool) {
    return 'E-mail uživatele ověřen: $bool';
  }

  @override
  String userId(Object id) {
    return 'ID uživatele: $id';
  }

  @override
  String get variableSymbol => 'Variabilní symbol';

  @override
  String get verifyEmail => 'Ověřit e-mail';

  @override
  String get version => 'Verze';

  @override
  String get vlozitNaBurzu => 'Vložit na burzu';
}
