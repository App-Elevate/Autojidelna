import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'texts_cs.dart';

/// Callers can lookup localized strings with an instance of Texts
/// returned by `Texts.of(context)`.
///
/// Applications need to include `Texts.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'output/texts.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Texts.localizationsDelegates,
///   supportedLocales: Texts.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Texts.supportedLocales
/// property.
abstract class Texts {
  Texts(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Texts of(BuildContext context) {
    return Localizations.of<Texts>(context, Texts)!;
  }

  static const LocalizationsDelegate<Texts> delegate = _TextsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('cs')];

  /// No description provided for @about.
  ///
  /// In cs, this message translates to:
  /// **'O aplikaci'**
  String get about;

  /// No description provided for @account.
  ///
  /// In cs, this message translates to:
  /// **'Účet'**
  String get account;

  /// No description provided for @accounts.
  ///
  /// In cs, this message translates to:
  /// **'Účty'**
  String get accounts;

  /// No description provided for @addAccount.
  ///
  /// In cs, this message translates to:
  /// **'Přidat účet'**
  String get addAccount;

  /// No description provided for @amoledMode.
  ///
  /// In cs, this message translates to:
  /// **'AMOLED mód'**
  String get amoledMode;

  /// No description provided for @amoledModeSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Přidej se k temné straně síly!'**
  String get amoledModeSubtitle;

  /// No description provided for @analytics.
  ///
  /// In cs, this message translates to:
  /// **'Shromažďování údajů'**
  String get analytics;

  /// No description provided for @analyticsDescription_1.
  ///
  /// In cs, this message translates to:
  /// **'Informace shromažďujeme výhradně za účelem oprav chyb v aplikaci a udržování základních statistických údajů. Nemůžeme vyzkoušet autojídelnu u jídelen, kde nemáme přístup, jsme na těchto informacích závislí. Podrobnější informace naleznete ve '**
  String get analyticsDescription_1;

  /// No description provided for @analyticsDescription_2.
  ///
  /// In cs, this message translates to:
  /// **'Zdrojovém kódu'**
  String get analyticsDescription_2;

  /// No description provided for @analyticsDescription_3.
  ///
  /// In cs, this message translates to:
  /// **' nebo v '**
  String get analyticsDescription_3;

  /// No description provided for @analyticsDescription_4.
  ///
  /// In cs, this message translates to:
  /// **'Zásadách ochrany osobních údajů.'**
  String get analyticsDescription_4;

  /// No description provided for @appName.
  ///
  /// In cs, this message translates to:
  /// **'Autojídelna'**
  String get appName;

  /// No description provided for @appDescription.
  ///
  /// In cs, this message translates to:
  /// **'Aplikace pro objednávání ze systému Icanteen. Cíl této aplikace je zjednodušit, zrychlit, (případně i zautomatizovat) objednávání obědů.'**
  String get appDescription;

  /// No description provided for @appearance.
  ///
  /// In cs, this message translates to:
  /// **'Vzhled'**
  String get appearance;

  /// appLegalese
  ///
  /// In cs, this message translates to:
  /// **'© 2023 - {year} Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3'**
  String appLegalese(DateTime year);

  /// No description provided for @calendarBigMarkers.
  ///
  /// In cs, this message translates to:
  /// **'Velké ukazatele v kalendáři'**
  String get calendarBigMarkers;

  /// No description provided for @cancel.
  ///
  /// In cs, this message translates to:
  /// **'Zrušit'**
  String get cancel;

  /// No description provided for @category.
  ///
  /// In cs, this message translates to:
  /// **'Kategorie'**
  String get category;

  /// No description provided for @changeAccount.
  ///
  /// In cs, this message translates to:
  /// **'Změnit účet'**
  String get changeAccount;

  /// No description provided for @convenience.
  ///
  /// In cs, this message translates to:
  /// **'Pohodlí'**
  String get convenience;

  /// No description provided for @credit.
  ///
  /// In cs, this message translates to:
  /// **'Kredit: {ammount} Kč'**
  String credit(double ammount);

  /// No description provided for @dateFormat.
  ///
  /// In cs, this message translates to:
  /// **'Formát dat'**
  String get dateFormat;

  /// No description provided for @debug.
  ///
  /// In cs, this message translates to:
  /// **'Debug'**
  String get debug;

  /// No description provided for @experimental.
  ///
  /// In cs, this message translates to:
  /// **'Experimentální'**
  String get experimental;

  /// No description provided for @gettingDataNotifications.
  ///
  /// In cs, this message translates to:
  /// **'Získávám data pro oznámení'**
  String get gettingDataNotifications;

  /// internetConnectionState
  ///
  /// In cs, this message translates to:
  /// **'{arg, select, other{Odpojeno od internetu} true{Připojeno k internetu}}'**
  String internetConnectionState(String arg);

  /// No description provided for @language.
  ///
  /// In cs, this message translates to:
  /// **'Jazyk'**
  String get language;

  /// No description provided for @languageCzech.
  ///
  /// In cs, this message translates to:
  /// **'Čeština'**
  String get languageCzech;

  /// No description provided for @languageEnglish.
  ///
  /// In cs, this message translates to:
  /// **'Angličtina'**
  String get languageEnglish;

  /// No description provided for @licenses.
  ///
  /// In cs, this message translates to:
  /// **'Licence'**
  String get licenses;

  /// No description provided for @listUi.
  ///
  /// In cs, this message translates to:
  /// **'List UI'**
  String get listUi;

  /// No description provided for @location.
  ///
  /// In cs, this message translates to:
  /// **'Výdejna'**
  String get location;

  /// No description provided for @login.
  ///
  /// In cs, this message translates to:
  /// **'Přihlásit se'**
  String get login;

  /// No description provided for @menu.
  ///
  /// In cs, this message translates to:
  /// **'Jídelníček'**
  String get menu;

  /// No description provided for @navigationRailExpantionButtonTitle.
  ///
  /// In cs, this message translates to:
  /// **'Menu'**
  String get navigationRailExpantionButtonTitle;

  /// No description provided for @more.
  ///
  /// In cs, this message translates to:
  /// **'Více'**
  String get more;

  /// No description provided for @name.
  ///
  /// In cs, this message translates to:
  /// **'Jméno'**
  String get name;

  /// No description provided for @noFood.
  ///
  /// In cs, this message translates to:
  /// **'Žádná jídla pro tento den.'**
  String get noFood;

  /// No description provided for @noThankYou.
  ///
  /// In cs, this message translates to:
  /// **'Ne, děkuji'**
  String get noThankYou;

  /// No description provided for @notifications.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení'**
  String get notifications;

  /// No description provided for @orders.
  ///
  /// In cs, this message translates to:
  /// **'Objednávky'**
  String get orders;

  /// No description provided for @password.
  ///
  /// In cs, this message translates to:
  /// **'Heslo'**
  String get password;

  /// No description provided for @patch.
  ///
  /// In cs, this message translates to:
  /// **'patch'**
  String get patch;

  /// No description provided for @paymentInfo.
  ///
  /// In cs, this message translates to:
  /// **'Platební Údaje'**
  String get paymentInfo;

  /// No description provided for @paymentAccountNumber.
  ///
  /// In cs, this message translates to:
  /// **'Číslo účtu'**
  String get paymentAccountNumber;

  /// No description provided for @personalInfo.
  ///
  /// In cs, this message translates to:
  /// **'Osobní Údaje'**
  String get personalInfo;

  /// No description provided for @pickLocation.
  ///
  /// In cs, this message translates to:
  /// **'Vyberte výdejnu:'**
  String get pickLocation;

  /// No description provided for @privacyPolicy.
  ///
  /// In cs, this message translates to:
  /// **'Zásady ochrany osobních údajů'**
  String get privacyPolicy;

  /// No description provided for @requestNotificationPermission.
  ///
  /// In cs, this message translates to:
  /// **'Požádat o povolení notifikací'**
  String get requestNotificationPermission;

  /// No description provided for @settings.
  ///
  /// In cs, this message translates to:
  /// **'Nastavení'**
  String get settings;

  /// No description provided for @shareApp.
  ///
  /// In cs, this message translates to:
  /// **'Sdílet aplikaci'**
  String get shareApp;

  /// No description provided for @signOut.
  ///
  /// In cs, this message translates to:
  /// **'Odhlásit se'**
  String get signOut;

  /// No description provided for @skipWeekends.
  ///
  /// In cs, this message translates to:
  /// **'Přeskakovat víkendy'**
  String get skipWeekends;

  /// No description provided for @specificSymbol.
  ///
  /// In cs, this message translates to:
  /// **'Specifický symbol'**
  String get specificSymbol;

  /// No description provided for @stopAnalytics.
  ///
  /// In cs, this message translates to:
  /// **'Zastavit sledování analytických služeb'**
  String get stopAnalytics;

  /// No description provided for @theme.
  ///
  /// In cs, this message translates to:
  /// **'Schéma'**
  String get theme;

  /// No description provided for @themeModeSystem.
  ///
  /// In cs, this message translates to:
  /// **'Systém'**
  String get themeModeSystem;

  /// No description provided for @themeModeLight.
  ///
  /// In cs, this message translates to:
  /// **'Světlý'**
  String get themeModeLight;

  /// No description provided for @themeModeDark.
  ///
  /// In cs, this message translates to:
  /// **'Tmavý'**
  String get themeModeDark;

  /// No description provided for @typeCrash.
  ///
  /// In cs, this message translates to:
  /// **'Napište \"crash\" pro pád aplikace'**
  String get typeCrash;

  /// No description provided for @variableSymbol.
  ///
  /// In cs, this message translates to:
  /// **'Variabilní symbol'**
  String get variableSymbol;

  /// No description provided for @version.
  ///
  /// In cs, this message translates to:
  /// **'Verze'**
  String get version;

  /// versionSubtitle
  ///
  /// In cs, this message translates to:
  /// **'{arg, select, true{Debug} other{Stable}} {version}'**
  String versionSubtitle(String arg, String version);

  /// No description provided for @view.
  ///
  /// In cs, this message translates to:
  /// **'Zobrazení'**
  String get view;
}

class _TextsDelegate extends LocalizationsDelegate<Texts> {
  const _TextsDelegate();

  @override
  Future<Texts> load(Locale locale) {
    return SynchronousFuture<Texts>(lookupTexts(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['cs'].contains(locale.languageCode);

  @override
  bool shouldReload(_TextsDelegate old) => false;
}

Texts lookupTexts(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return TextsCs();
  }

  throw FlutterError(
      'Texts.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
