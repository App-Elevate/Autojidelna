import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

mixin Alocale {
  static isLocaleSupported(Locale locale) {
    for (final MapLocale mapLocale in mapLocales) {
      if (mapLocale.locale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  static const Locale defaultLocale = Locale('en');
  static const List<MapLocale> mapLocales = [
    MapLocale('en', en),
    MapLocale('cs', cs),
  ];

  static const String language = 'language';
  static const String languageName = 'language_name';
  static const String appName = 'app_name';
  static const String debug = 'debug';
  static const String appDescription = 'app_description';
  static const String counting = 'counting';
  static const String crashlytics = 'crashlytics';
  static const String settings = 'settings';

  static const String crashlyticsPage = 'crashlytics_page';
  static const String crashlyticsTestCrash = 'crashlytics_test_crash';

  static const String routingParamPage = 'routing_param_page';
  static const String routingParamPageDetail = 'routing_param_page_detail';
  static const String routingParamPageDetail2 = 'routing_param_page_detail2';
  static const String routingParamFilmId = 'routing_param_film_id';
  static const String routingParamQueryFilmId = 'routing_param_query_film_id';

  static const String routingParamDetailPageDetail = 'routing_param_detail_page_detail';
  static const String routingParamDetailPageDetail1 = 'routing_param_detail_page_detail1';
  static const String routingParamDetailPageDetail2 = 'routing_param_detail_page_detail2';
  static const String routingParamDetailPageDetail3 = 'routing_param_detail_page_detail3';

  static const String routingTestDetailDetail = 'routing_test_detail_detail';
  static const String routingTestDetailDetailText = 'routing_test_detail_detail_text';
  static const String goBack = 'go_back';

  static const String routingGoToDetailDetail = 'routing_go_to_detail_detail';
  static const String routingGoToDetailPage = 'routing_go_to_detail_page';
  static const String routingGoToParamDetailPage = 'routing_go_to_param_detail_page';

  static const String routingTestPage = 'routing_test_page';

  static const String routingTestPageDetail = 'routing_test_page_detail';
  static const String routingTestPageDetail1 = 'routing_test_page_detail1';

  static const String demoPageTitle = 'demo_page_title';
  static const String buttonPushed = 'button_pushed';

  static const String localization = 'localization';
  static const String showLocale = 'show_locale';

  static const String providerTestPage = 'provider_test_page';
  static const String remoteConfig = 'remote_config';
  static const String connectedToTheInternet = 'connected_to_the_internet';
  static const String connectedToANetwork = 'connected_to_a_network';
  static const String disconnectedFromTheInternet = 'disconnected_from_the_internet';
  static const String disconnectedFromANetwork = 'disconnected_from_a_network';

  static const String login = 'login';
  static const String secret = 'secret';
  static const String secretPage = 'secret_page';
  static const String secretGoogle = 'secret_google';
  static const String secretGoogleContent = 'secret_google_content';
  static const String appleSecret = 'apple_secret';
  static const String appleSecretContent = 'apple_secret_content';
  static const String goToSettings = 'go_to_settings';
  static const String signInAnonymously = 'sign_in_anonymously';
  static const String signInWithGoogle = 'sign_in_with_google';
  static const String signInWithApple = 'sign_in_with_apple';
  static const String signOut = 'sign_out';
  static const String deleteAccount = 'delete_account';
  static const String verifyEmail = 'verify_email';

  static const String email = 'email';
  static const String password = 'password';
  static const String enterYourEmail = 'enter_your_email';
  static const String enterAValidEmailAddress = 'enter_a_valid_email_address';
  static const String enterYourPassword = 'enter_your_password';
  static const String passwordMustBeAtLeast6CharactersLong = 'password_must_be_at_least_6_characters_long';
  static const String signInWithEmailAndPassword = 'sign_in_with_email_and_password';
  static const String createAccount = 'create_account';

  static const String languageEnglish = 'language_english';
  static const String languageCzech = 'language_czech';

  static const Map<String, dynamic> en = {
    language: 'Language',
    languageName: 'English',

    languageEnglish: 'English',
    languageCzech: 'Czech',

    // about_app_button_widget.dart
    appName: 'APPE Coree',
    debug: ' - debug',
    appDescription: 'Application that is the basis for other applications.',

    counting: 'Counting',
    crashlytics: 'Crashlytics',
    settings: 'Settings',

    crashlyticsPage: 'Crashlytics Page',
    crashlyticsTestCrash: 'Crashlytics test crash!',

    routingParamPage: 'Routing Param Page',
    routingParamPageDetail: 'This is a routing param page.',
    routingParamPageDetail2: 'It is used to test routing with parameters.',
    routingParamFilmId: 'Path param Film ID',
    routingParamQueryFilmId: 'Query param Film ID',

    routingParamDetailPageDetail: 'Routing Param Detail Page',
    routingParamDetailPageDetail1: 'This is a routing param detail page.',
    routingParamDetailPageDetail2: 'It is used to test routing with parameters.',
    routingParamDetailPageDetail3: 'Film ID: %a',

    routingTestDetailDetail: 'Routing Test Detail Detail',
    routingTestDetailDetailText: 'This is a routing test detail detail page.',
    goBack: 'Go back',
    routingGoToDetailDetail: 'Go to Detail Detail',
    routingGoToDetailPage: 'Go to Detail Page',
    routingGoToParamDetailPage: 'Go to Param Detail Page',

    routingTestPage: 'Settings',
    routingTestPageDetail: 'This is a routing test page.',
    routingTestPageDetail1: 'It is used to test routing.',

    demoPageTitle: 'Demo Page',
    buttonPushed: 'You have pushed the button this many times:',

    localization: 'Localizations',
    showLocale: 'Show locale',

    providerTestPage: 'Provider Test Page',
    remoteConfig: 'Remote Config',

    connectedToTheInternet: 'Connected to the internet',
    connectedToANetwork: 'Connected to a network',
    disconnectedFromTheInternet: 'Disconnected from the internet',
    disconnectedFromANetwork: 'Disconnected from a network',

    login: 'Login',
    secret: 'secret',
    secretGoogle: 'secret Google',
    appleSecret: 'Apple Femboy Secret',
    secretGoogleContent: 'Flutter + Google = ❤️',
    appleSecretContent: 'Flutter + Apple = ❤️',

    goToSettings: 'Go to settings',
    signInAnonymously: 'Sign in Anonymously',
    signInWithGoogle: 'Sign in with Google',
    signInWithApple: 'Sign in with Apple',
    signOut: 'Sign out',
    deleteAccount: 'Delete account',
    verifyEmail: 'Verify email',
    email: 'Email',
    password: 'Password',
    enterYourEmail: 'Please enter your email',
    enterAValidEmailAddress: 'Please enter a valid email address',
    enterYourPassword: 'Please enter your password',
    passwordMustBeAtLeast6CharactersLong: 'Password must be at least 6 characters long',
    signInWithEmailAndPassword: 'Sign in with email and password',
    createAccount: 'Create account with email and password',

    secretPage: 'Secret Page',
  };
  static const Map<String, dynamic> cs = {
    language: 'Jazyk',
    languageName: 'Čeština',

    languageEnglish: 'Angličtina',
    languageCzech: 'Čeština',

    // about_app_button_widget.dart
    appName: 'APPE Coree',
    debug: ' - debug',
    appDescription: 'Aplikace, která je základ pro další aplikace.',

    counting: 'Počítání',
    crashlytics: 'Crashlytics',
    settings: 'Nastavení',

    crashlyticsPage: 'Stránka Crashlytics',
    crashlyticsTestCrash: 'Testovací pád Crashlytics yohooo!',

    routingParamPage: 'Stránka s parametry směrování',
    routingParamPageDetail: 'Toto je stránka s parametry směrování.',
    routingParamPageDetail2: 'Slouží k testování směrování s parametry.',
    routingParamFilmId: 'Cesta param Film ID',
    routingParamQueryFilmId: 'Dotaz param Film ID',

    routingParamDetailPageDetail: 'Stránka s podrobnostmi o parametrech směrování',
    routingParamDetailPageDetail1: 'Toto je stránka s podrobnostmi o parametrech směrování.',
    routingParamDetailPageDetail2: 'Slouží k testování směrování s parametry.',
    routingParamDetailPageDetail3: 'Film ID: %a',

    routingTestDetailDetail: 'Podrobnosti o testování směrování',
    routingTestDetailDetailText: 'Toto je podostránka s podrobnostmi o testování směrování.',
    goBack: 'Jít zpět',
    routingGoToDetailDetail: 'Jít na podrobnosti podrobností',
    routingGoToDetailPage: 'Jít na podrobnosti stránky',
    routingGoToParamDetailPage: 'Jít na podrobnosti stránky s parametry',

    routingTestPage: 'Nastavení',
    routingTestPageDetail: 'Toto je stránka s testováním směrování.',
    routingTestPageDetail1: 'Slouží k testování směrování.',

    demoPageTitle: 'Demo stránka',
    buttonPushed: 'Tlačítko jste stiskli tolikrát:',

    localization: 'Lokalizace',
    showLocale: 'Zobrazit lokalizaci',

    providerTestPage: 'Stránka testování poskytovatele',
    remoteConfig: 'Vzdálená konfigurace',

    connectedToANetwork: 'Připojeno k síti',
    connectedToTheInternet: 'Připojeno k internetu',
    disconnectedFromANetwork: 'Odpojeno od sítě',
    disconnectedFromTheInternet: 'Odpojeno od internetu',

    login: 'přihlásit se',
    secret: 'tajemství',
    secretGoogle: 'tajemství Google',
    appleSecret: 'Apple velký tajemství',
    secretGoogleContent: 'Flutter + Google = ❤️',
    appleSecretContent: 'Flutter + Apple = ❤️',

    goToSettings: 'Jít na nastavení',
    signInAnonymously: 'Přihlásit se anonymně',
    signInWithGoogle: 'Přihlásit se pomocí Google',
    signInWithApple: 'Přihlásit se pomocí Apple',
    signOut: 'Odhlásit se',
    deleteAccount: 'Smazat účet',
    verifyEmail: 'Ověřit e-mail',
    email: 'E-mail',
    password: 'Heslo',
    enterYourEmail: 'Zadejte svůj e-mail',
    enterAValidEmailAddress: 'Zadejte platnou e-mailovou adresu',
    enterYourPassword: 'Zadejte své heslo',
    passwordMustBeAtLeast6CharactersLong: 'Heslo musí mít alespoň 6 znaků',
    signInWithEmailAndPassword: 'Přihlásit se pomocí e-mailu a hesla',
    createAccount: 'Vytvořit účet s e-mailem a heslem',

    secretPage: 'Tajná stránka',
  };
}
