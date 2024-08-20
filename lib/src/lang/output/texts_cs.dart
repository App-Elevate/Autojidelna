import 'package:intl/intl.dart' as intl;

import 'texts.dart';

/// The translations for Czech (`cs`).
class TextsCs extends Texts {
  TextsCs([String locale = 'cs']) : super(locale);

  @override
  String get accountStatus => 'Stav účtu';

  @override
  String accountcreationTime(DateTime date) {
    final intl.DateFormat dateDateFormat =
        intl.DateFormat.yMMMMEEEEd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Čas vytvoření účtu: $dateString';
  }

  @override
  String get appDescription => 'Aplikace, která je základ pro další aplikace.';

  @override
  String get appName => 'APPE Coree';

  @override
  String get appleSecret => 'Apple velký tajemství';

  @override
  String get appleSecretContent => 'Flutter + Apple = ❤️';

  @override
  String get buttonPushed => 'Tlačítko jste stiskli tolikrát:';

  @override
  String get connectedToANetwork => 'Připojeno k síti';

  @override
  String get connectedToTheInternet => 'Připojeno k internetu';

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
  String get debug => ' - debug';

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
  String get email => 'E-mail';

  @override
  String get enterAValidEmailAddress => 'Zadejte platnou e-mailovou adresu';

  @override
  String get enterYourEmail => 'Zadejte svůj e-mail';

  @override
  String get enterYourPassword => 'Zadejte své heslo';

  @override
  String get goBack => 'Jít zpět';

  @override
  String get goToSettings => 'Jít na nastavení';

  @override
  String get language => 'Jazyk';

  @override
  String get languageCzech => 'Čeština';

  @override
  String get languageEnglish => 'Angličtina';

  @override
  String get languageName => 'Čeština';

  @override
  String lastSignInTime(DateTime date) {
    final intl.DateFormat dateDateFormat =
        intl.DateFormat.yMMMMEEEEd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Čas posledního přihlášení: $dateString';
  }

  @override
  String get localization => 'Lokalizace';

  @override
  String loggedIn(String bool) {
    return 'Přihlášen: $bool';
  }

  @override
  String get login => 'přihlásit se';

  @override
  String get noThankYou => 'Ne, děkuji';

  @override
  String get password => 'Heslo';

  @override
  String get passwordMustBeAtLeast6CharactersLong =>
      'Heslo musí mít alespoň 6 znaků';

  @override
  String providerId(String id) {
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
  String routingParamDetailPageDetail3(String filmId) {
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
  String get secretGoogle => 'secret Google';

  @override
  String get secretGoogleContent => 'Flutter + Google = ❤️';

  @override
  String get secretPage => 'Tajná stránka';

  @override
  String get settings => 'Nastavení';

  @override
  String get showLocale => 'Zobrazit lokalizaci';

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
  String get typeCrash => 'Napište \"crash\" pro pád aplikace';

  @override
  String userDisplayName(String name) {
    return 'Zobrazované jméno uživatele: $name';
  }

  @override
  String userEmail(String email) {
    return 'E-mail uživatele: $email';
  }

  @override
  String userEmailVerified(String bool) {
    return 'E-mail uživatele ověřen: $bool';
  }

  @override
  String userId(String id) {
    return 'ID uživatele: $id';
  }

  @override
  String get verifyEmail => 'Ověřit e-mail';
}
