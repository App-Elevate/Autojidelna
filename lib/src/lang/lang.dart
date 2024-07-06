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

  static const Map<String, dynamic> en = {
    language: 'Language',
    languageName: 'English',

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
  };
  static const Map<String, dynamic> cs = {
    language: 'Jazyk',
    languageName: 'Čeština',

    // about_app_button_widget.dart
    appName: 'APPE Coree',
    debug: ' - debug',
    appDescription: 'Aplikace, která je základ pro další aplikace.',

    counting: 'Počítání',
    crashlytics: 'Crashlytics',
    settings: 'Nastavení',

    crashlyticsPage: 'Stránka Crashlytics',
    crashlyticsTestCrash: 'Testovací pád Crashlytics!',

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
  };
}
