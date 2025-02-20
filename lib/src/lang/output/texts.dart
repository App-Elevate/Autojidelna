import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'texts_cs.dart';

// ignore_for_file: type=lint

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

  /// No description provided for @aboutCopyRight.
  ///
  /// In cs, this message translates to:
  /// **'© 2023 - {time} Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3'**
  String aboutCopyRight(DateTime time);

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

  /// No description provided for @allergens.
  ///
  /// In cs, this message translates to:
  /// **'Alergeny'**
  String get allergens;

  /// No description provided for @allowPermission.
  ///
  /// In cs, this message translates to:
  /// **'Udělit oprávnění'**
  String get allowPermission;

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

  /// No description provided for @amoledSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Přidej se k temné straně síly!'**
  String get amoledSubtitle;

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

  /// No description provided for @appDescription.
  ///
  /// In cs, this message translates to:
  /// **'Aplikace pro objednávání ze systému Icanteen. Cíl této aplikace je zjednodušit, zrychlit, (případně i zautomatizovat) objednávání obědů.'**
  String get appDescription;

  /// appLegalese
  ///
  /// In cs, this message translates to:
  /// **'© 2023 - {year} Tomáš Protiva, Matěj Verhaegen a kolaborátoři\nZveřejněno pod licencí GNU GPLv3'**
  String appLegalese(DateTime year);

  /// No description provided for @appName.
  ///
  /// In cs, this message translates to:
  /// **'Autojídelna'**
  String get appName;

  /// No description provided for @appearance.
  ///
  /// In cs, this message translates to:
  /// **'Vzhled'**
  String get appearance;

  /// No description provided for @appearence.
  ///
  /// In cs, this message translates to:
  /// **'Vzhled'**
  String get appearence;

  /// No description provided for @burzaAlertDialogContent.
  ///
  /// In cs, this message translates to:
  /// **'Přidáváte jídlo na burzu. Peníze se Vám vrátí pouze v případě, že si jídlo objedná někdo jiný.'**
  String get burzaAlertDialogContent;

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

  /// No description provided for @currency.
  ///
  /// In cs, this message translates to:
  /// **'Kč'**
  String get currency;

  /// No description provided for @darkThemeMode.
  ///
  /// In cs, this message translates to:
  /// **'Tmavý'**
  String get darkThemeMode;

  /// No description provided for @dataCollection.
  ///
  /// In cs, this message translates to:
  /// **'Shromažďování údajů'**
  String get dataCollection;

  /// No description provided for @dataCollectionAgreement.
  ///
  /// In cs, this message translates to:
  /// **'Používáním aplikace souhlasíte se zasíláním anonymních dat. '**
  String get dataCollectionAgreement;

  /// No description provided for @dataCollectionDescription_1.
  ///
  /// In cs, this message translates to:
  /// **'Informace shromažďujeme výhradně za účelem oprav chyb v aplikaci a udržování základních statistických údajů. Nemůžeme vyzkoušet autojídelnu u jídelen, kde nemáme přístup, jsme na těchto informacích závislí. Podrobnější informace naleznete ve '**
  String get dataCollectionDescription_1;

  /// No description provided for @dataCollectionDescription_2.
  ///
  /// In cs, this message translates to:
  /// **'Zdrojovém kódu'**
  String get dataCollectionDescription_2;

  /// No description provided for @dataCollectionDescription_3.
  ///
  /// In cs, this message translates to:
  /// **' nebo v '**
  String get dataCollectionDescription_3;

  /// No description provided for @dataCollectionDescription_4.
  ///
  /// In cs, this message translates to:
  /// **'Zásadách ochrany osobních údajů.'**
  String get dataCollectionDescription_4;

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

  /// No description provided for @display.
  ///
  /// In cs, this message translates to:
  /// **'Zobrazení'**
  String get display;

  /// No description provided for @dochazejiciKreditChannelDescription.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení o tom, zda vám dochází kredit týden dopředu pro {username}'**
  String dochazejiciKreditChannelDescription(String username);

  /// No description provided for @dochazejiciKreditChannelName.
  ///
  /// In cs, this message translates to:
  /// **'Docházející kredit'**
  String get dochazejiciKreditChannelName;

  /// No description provided for @dontShowAgain.
  ///
  /// In cs, this message translates to:
  /// **'Příště nezobrazovat'**
  String get dontShowAgain;

  /// No description provided for @drinks.
  ///
  /// In cs, this message translates to:
  /// **'Pití'**
  String get drinks;

  /// No description provided for @error.
  ///
  /// In cs, this message translates to:
  /// **'Chyba'**
  String get error;

  /// No description provided for @errorsAccountNotFound.
  ///
  /// In cs, this message translates to:
  /// **'Účet nenalezen'**
  String get errorsAccountNotFound;

  /// No description provided for @errorsAccountNotFoundSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Jste si jistí, že existujete? Přihlaste se ručně.'**
  String get errorsAccountNotFoundSubtitle;

  /// No description provided for @errorsAddingToMarketplace.
  ///
  /// In cs, this message translates to:
  /// **'Chyba při dávání jídla na burzu'**
  String get errorsAddingToMarketplace;

  /// No description provided for @errorsAddingToMarketplaceSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Něco se pokazilo, zkuste to znovu.'**
  String get errorsAddingToMarketplaceSubtitle;

  /// No description provided for @errorsCancelingOrder.
  ///
  /// In cs, this message translates to:
  /// **'Chyba při rušení objednávky'**
  String get errorsCancelingOrder;

  /// No description provided for @errorsCancelingOrderSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Objednávku se nepodařilo zrušit.'**
  String get errorsCancelingOrderSubtitle;

  /// No description provided for @errorsConnectionFailed.
  ///
  /// In cs, this message translates to:
  /// **'Server si dal pauzu'**
  String get errorsConnectionFailed;

  /// No description provided for @errorsConnectionFailedSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Zkuste to později, možná si jen dává kafe.'**
  String get errorsConnectionFailedSubtitle;

  /// No description provided for @errorsDishCancellationExpired.
  ///
  /// In cs, this message translates to:
  /// **'Objednávku nelze zrušit'**
  String get errorsDishCancellationExpired;

  /// No description provided for @errorsDishCancellationExpiredSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Platnost objednávky vypršela, není už možné ji zrušit.'**
  String get errorsDishCancellationExpiredSubtitle;

  /// No description provided for @errorsDishCannotBeOrdered.
  ///
  /// In cs, this message translates to:
  /// **'Oběd nelze objednat'**
  String get errorsDishCannotBeOrdered;

  /// No description provided for @errorsDishCannotBeOrderedSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Momentálně to není možné. Zkuste to za chvíli.'**
  String get errorsDishCannotBeOrderedSubtitle;

  /// No description provided for @errorsDishNotInMarketplace.
  ///
  /// In cs, this message translates to:
  /// **'Jídlo není na burze'**
  String get errorsDishNotInMarketplace;

  /// No description provided for @errorsDishNotInMarketplaceSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Možná jste si vybrali něco, co tam už není. Zkuste jinou možnost.'**
  String get errorsDishNotInMarketplaceSubtitle;

  /// No description provided for @errorsDishOrdering.
  ///
  /// In cs, this message translates to:
  /// **'Chyba při objednávání jídla'**
  String get errorsDishOrdering;

  /// No description provided for @errorsDishOrderingSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Něco se pokazilo při odesílání vaší objednávky. Zkuste to znovu.'**
  String get errorsDishOrderingSubtitle;

  /// No description provided for @errorsGotInternetConnection.
  ///
  /// In cs, this message translates to:
  /// **'Jste zpět online!'**
  String get errorsGotInternetConnection;

  /// No description provided for @errorsGotInternetConnectionSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Síť je v pořádku. Pokračujeme!'**
  String get errorsGotInternetConnectionSubtitle;

  /// No description provided for @errorsInsufficientCredit.
  ///
  /// In cs, this message translates to:
  /// **'Nedostatečný kredit'**
  String get errorsInsufficientCredit;

  /// No description provided for @errorsInsufficientCreditSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Chcete-li objednat, přidejte kredit. Bez něj to nepůjde.'**
  String get errorsInsufficientCreditSubtitle;

  /// No description provided for @errorsLoadingData.
  ///
  /// In cs, this message translates to:
  /// **'Nastala chyba při načítání dat'**
  String get errorsLoadingData;

  /// No description provided for @errorsMenuLoadingFailed.
  ///
  /// In cs, this message translates to:
  /// **'Chyba při načítání jídelníčku'**
  String get errorsMenuLoadingFailed;

  /// No description provided for @errorsMenuLoadingFailedSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Něco se zadrhlo při načítání nabídky. Zkuste to později.'**
  String get errorsMenuLoadingFailedSubtitle;

  /// No description provided for @errorsNoInternetConnection.
  ///
  /// In cs, this message translates to:
  /// **'Žádné připojení k internetu'**
  String get errorsNoInternetConnection;

  /// No description provided for @errorsNoInternetConnectionSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Kontrolujeme síť... ujistěte se, že jste online.'**
  String get errorsNoInternetConnectionSubtitle;

  /// No description provided for @errorsWrongCredentials.
  ///
  /// In cs, this message translates to:
  /// **'Špatné údaje, špatný den?'**
  String get errorsWrongCredentials;

  /// No description provided for @errorsWrongCredentialsSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Zkuste to znovu – nebo si je změňte.'**
  String get errorsWrongCredentialsSubtitle;

  /// No description provided for @errorsWrongCredentialsTextField.
  ///
  /// In cs, this message translates to:
  /// **'Přihlašovací údaje jsou nesprávné.'**
  String get errorsWrongCredentialsTextField;

  /// No description provided for @errorsWrongUrl.
  ///
  /// In cs, this message translates to:
  /// **'Špatná adresa'**
  String get errorsWrongUrl;

  /// No description provided for @errorsWrongUrlSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Tahle cesta nikam nevede. Zkontrolujte adresu.'**
  String get errorsWrongUrlSubtitle;

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

  /// No description provided for @jidloChannelDescription.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení každý den o tom jaké je dnes jídlo pro {username}'**
  String jidloChannelDescription(String username);

  /// No description provided for @jidloChannelName.
  ///
  /// In cs, this message translates to:
  /// **'Dnešní jídlo'**
  String get jidloChannelName;

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

  /// No description provided for @lightThemeMode.
  ///
  /// In cs, this message translates to:
  /// **'Světlý'**
  String get lightThemeMode;

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

  /// No description provided for @locationsUnknown.
  ///
  /// In cs, this message translates to:
  /// **'Neznámá výdejna'**
  String get locationsUnknown;

  /// No description provided for @login.
  ///
  /// In cs, this message translates to:
  /// **'Přihlásit se'**
  String get login;

  /// No description provided for @loginPasswordFieldHint.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte heslo'**
  String get loginPasswordFieldHint;

  /// No description provided for @loginPasswordFieldLabel.
  ///
  /// In cs, this message translates to:
  /// **'Heslo'**
  String get loginPasswordFieldLabel;

  /// No description provided for @loginSuccess.
  ///
  /// In cs, this message translates to:
  /// **'Přihlášení úspěšné!'**
  String get loginSuccess;

  /// No description provided for @loginSuccessSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Vítejte zpět, {username}!'**
  String loginSuccessSubtitle(String username);

  /// No description provided for @loginUrlFieldHint.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte adresu stránky icanteen'**
  String get loginUrlFieldHint;

  /// No description provided for @loginUrlFieldLabel.
  ///
  /// In cs, this message translates to:
  /// **'Adresa stránky icanteen'**
  String get loginUrlFieldLabel;

  /// No description provided for @loginUserFieldHint.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte uživatelské jméno'**
  String get loginUserFieldHint;

  /// No description provided for @loginUserFieldLabel.
  ///
  /// In cs, this message translates to:
  /// **'Uživatelské jméno'**
  String get loginUserFieldLabel;

  /// No description provided for @logoutConfirm.
  ///
  /// In cs, this message translates to:
  /// **'Odhlásit se'**
  String get logoutConfirm;

  /// No description provided for @logoutUSure.
  ///
  /// In cs, this message translates to:
  /// **'Opravdu se chcete odhlásit?'**
  String get logoutUSure;

  /// No description provided for @mainCourse.
  ///
  /// In cs, this message translates to:
  /// **'Hlavní chod'**
  String get mainCourse;

  /// No description provided for @menu.
  ///
  /// In cs, this message translates to:
  /// **'Jídelníček'**
  String get menu;

  /// No description provided for @more.
  ///
  /// In cs, this message translates to:
  /// **'Více'**
  String get more;

  /// No description provided for @moreInfo.
  ///
  /// In cs, this message translates to:
  /// **'Více informací.'**
  String get moreInfo;

  /// No description provided for @name.
  ///
  /// In cs, this message translates to:
  /// **'Jméno'**
  String get name;

  /// No description provided for @navigationRailExpantionButtonTitle.
  ///
  /// In cs, this message translates to:
  /// **'Menu'**
  String get navigationRailExpantionButtonTitle;

  /// No description provided for @nedostatekKreditu.
  ///
  /// In cs, this message translates to:
  /// **'Nedostatek kreditu'**
  String get nedostatekKreditu;

  /// No description provided for @nelzeObjednat.
  ///
  /// In cs, this message translates to:
  /// **'Nelze objednat'**
  String get nelzeObjednat;

  /// No description provided for @nelzeZrusit.
  ///
  /// In cs, this message translates to:
  /// **'Nelze zrušit'**
  String get nelzeZrusit;

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

  /// No description provided for @notificationDochaziVamKredit.
  ///
  /// In cs, this message translates to:
  /// **'Dochází vám kredit!'**
  String get notificationDochaziVamKredit;

  /// No description provided for @notificationKreditPro.
  ///
  /// In cs, this message translates to:
  /// **'Kredit pro {username}: {ammount} Kč'**
  String notificationKreditPro(String username, String ammount);

  /// No description provided for @notificationObjednejteSi.
  ///
  /// In cs, this message translates to:
  /// **'Objednejte si na příští týden'**
  String get notificationObjednejteSi;

  /// No description provided for @notificationObjednejteSiDetail.
  ///
  /// In cs, this message translates to:
  /// **'Uživatel {username} si stále ještě neobjenal na příští týden'**
  String notificationObjednejteSiDetail(String username);

  /// No description provided for @notificationZtlumit.
  ///
  /// In cs, this message translates to:
  /// **'Ztlumit na týden'**
  String get notificationZtlumit;

  /// No description provided for @notifications.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení'**
  String get notifications;

  /// No description provided for @notificationsFor.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení pro {username}'**
  String notificationsFor(String username);

  /// No description provided for @objednanoChannelDescription.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení týden dopředu o tom, zda jste si objednal jídlo na příští týden pro {username}'**
  String objednanoChannelDescription(String username);

  /// No description provided for @objednanoChannelName.
  ///
  /// In cs, this message translates to:
  /// **'Objednáno?'**
  String get objednanoChannelName;

  /// No description provided for @objednat.
  ///
  /// In cs, this message translates to:
  /// **'Objednat'**
  String get objednat;

  /// No description provided for @objednatAction.
  ///
  /// In cs, this message translates to:
  /// **'Objednat náhodně'**
  String get objednatAction;

  /// No description provided for @objednatZBurzy.
  ///
  /// In cs, this message translates to:
  /// **'Objednat z burzy'**
  String get objednatZBurzy;

  /// No description provided for @odebratZBurzy.
  ///
  /// In cs, this message translates to:
  /// **'Odebrat z burzy'**
  String get odebratZBurzy;

  /// No description provided for @ok.
  ///
  /// In cs, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @other.
  ///
  /// In cs, this message translates to:
  /// **'Ostatní'**
  String get other;

  /// No description provided for @otherDescription.
  ///
  /// In cs, this message translates to:
  /// **'Ostatní oznámení, např. chybové hlášky'**
  String get otherDescription;

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

  /// No description provided for @paymentAccountNumber.
  ///
  /// In cs, this message translates to:
  /// **'Číslo účtu'**
  String get paymentAccountNumber;

  /// No description provided for @paymentInfo.
  ///
  /// In cs, this message translates to:
  /// **'Platební Údaje'**
  String get paymentInfo;

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

  /// No description provided for @settingsNemateObjednano.
  ///
  /// In cs, this message translates to:
  /// **'Nemáte objednáno na příští týden'**
  String get settingsNemateObjednano;

  /// No description provided for @settingsNotificationFor.
  ///
  /// In cs, this message translates to:
  /// **'Oznámení pro {username}'**
  String settingsNotificationFor(String username);

  /// No description provided for @settingsRelativeTimestamps.
  ///
  /// In cs, this message translates to:
  /// **'Relativní časové značky'**
  String get settingsRelativeTimestamps;

  /// No description provided for @settingsRelativeTimestampsSub.
  ///
  /// In cs, this message translates to:
  /// **'„Dnes“ místo „{date}“'**
  String settingsRelativeTimestampsSub(String date);

  /// No description provided for @settingsSkipWeekends.
  ///
  /// In cs, this message translates to:
  /// **'Přeskakovat víkendy'**
  String get settingsSkipWeekends;

  /// No description provided for @settingsStopDataCollection.
  ///
  /// In cs, this message translates to:
  /// **'Zastavit sledování analytických služeb'**
  String get settingsStopDataCollection;

  /// No description provided for @settingsTheme.
  ///
  /// In cs, this message translates to:
  /// **'Schéma'**
  String get settingsTheme;

  /// No description provided for @settingsTitleCredit.
  ///
  /// In cs, this message translates to:
  /// **'Nízký credit'**
  String get settingsTitleCredit;

  /// No description provided for @settingsTitleTodaysFood.
  ///
  /// In cs, this message translates to:
  /// **'Dnešní jídlo'**
  String get settingsTitleTodaysFood;

  /// No description provided for @shareApp.
  ///
  /// In cs, this message translates to:
  /// **'Sdílet aplikaci'**
  String get shareApp;

  /// No description provided for @shareDescription.
  ///
  /// In cs, this message translates to:
  /// **'Autojídelna (aplikace na objednávání jídla)'**
  String get shareDescription;

  /// No description provided for @sideDish.
  ///
  /// In cs, this message translates to:
  /// **'Přílohy'**
  String get sideDish;

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

  /// No description provided for @soup.
  ///
  /// In cs, this message translates to:
  /// **'Polévka'**
  String get soup;

  /// No description provided for @specificSymbol.
  ///
  /// In cs, this message translates to:
  /// **'Specifický symbol'**
  String get specificSymbol;

  /// No description provided for @stable.
  ///
  /// In cs, this message translates to:
  /// **'Stable'**
  String get stable;

  /// No description provided for @statistics.
  ///
  /// In cs, this message translates to:
  /// **'Statistiky'**
  String get statistics;

  /// No description provided for @stopAnalytics.
  ///
  /// In cs, this message translates to:
  /// **'Zastavit sledování analytických služeb'**
  String get stopAnalytics;

  /// No description provided for @systemThemeMode.
  ///
  /// In cs, this message translates to:
  /// **'Systém'**
  String get systemThemeMode;

  /// No description provided for @tabletUi.
  ///
  /// In cs, this message translates to:
  /// **'Tablet UI'**
  String get tabletUi;

  /// tabletUiOptions
  ///
  /// In cs, this message translates to:
  /// **'{arg, select, other{error} auto{Automaticky} always{Vždy} landscape{Na šířku} never{Nikdy}}'**
  String tabletUiOptions(String arg);

  /// No description provided for @theme.
  ///
  /// In cs, this message translates to:
  /// **'Schéma'**
  String get theme;

  /// No description provided for @themeModeDark.
  ///
  /// In cs, this message translates to:
  /// **'Tmavý'**
  String get themeModeDark;

  /// No description provided for @themeModeLight.
  ///
  /// In cs, this message translates to:
  /// **'Světlý'**
  String get themeModeLight;

  /// No description provided for @themeModeSystem.
  ///
  /// In cs, this message translates to:
  /// **'Systém'**
  String get themeModeSystem;

  /// No description provided for @tryAgain.
  ///
  /// In cs, this message translates to:
  /// **'Zkusit znovu'**
  String get tryAgain;

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

  /// No description provided for @vlozitNaBurzu.
  ///
  /// In cs, this message translates to:
  /// **'Vložit na burzu'**
  String get vlozitNaBurzu;

  /// No description provided for @welcome.
  ///
  /// In cs, this message translates to:
  /// **'Vítejte!'**
  String get welcome;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Pojďme nastavit nějaké věci. Později je můžete změnit v nastavení.'**
  String get onboardingSubtitle;

  /// No description provided for @allowNotifications.
  ///
  /// In cs, this message translates to:
  /// **'Povolit oznámení'**
  String get allowNotifications;

  /// No description provided for @allowNotifcitaionsReasons.
  ///
  /// In cs, this message translates to:
  /// **'Dáme vám vědět o důležitých informacích, jako je nízký kredit nebo připomenutí objednávky.'**
  String get allowNotifcitaionsReasons;

  /// No description provided for @grant.
  ///
  /// In cs, this message translates to:
  /// **'Udělit'**
  String get grant;

  /// No description provided for @next.
  ///
  /// In cs, this message translates to:
  /// **'Další'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In cs, this message translates to:
  /// **'Začínáme'**
  String get getStarted;

  /// No description provided for @loginSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Přihlaste se a můžeme začít. Užijte si všechny funkce aplikace!'**
  String get loginSubtitle;
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
