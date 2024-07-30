import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'texts_cs.dart';
import 'texts_en.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('en')
  ];

  /// No description provided for @accountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get accountStatus;

  /// No description provided for @accountcreationTime.
  ///
  /// In en, this message translates to:
  /// **'Account Creation Time: {date}'**
  String accountcreationTime(DateTime date);

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Application that is the basis for other applications.'**
  String get appDescription;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'APPE Coree'**
  String get appName;

  /// No description provided for @appleSecret.
  ///
  /// In en, this message translates to:
  /// **'Apple Femboy Secret'**
  String get appleSecret;

  /// No description provided for @appleSecretContent.
  ///
  /// In en, this message translates to:
  /// **'Flutter + Apple = ❤️'**
  String get appleSecretContent;

  /// No description provided for @buttonPushed.
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get buttonPushed;

  /// No description provided for @connectedToANetwork.
  ///
  /// In en, this message translates to:
  /// **'Connected to a network'**
  String get connectedToANetwork;

  /// No description provided for @connectedToTheInternet.
  ///
  /// In en, this message translates to:
  /// **'Connected to the internet'**
  String get connectedToTheInternet;

  /// No description provided for @counting.
  ///
  /// In en, this message translates to:
  /// **'Counting'**
  String get counting;

  /// No description provided for @crashlytics.
  ///
  /// In en, this message translates to:
  /// **'Crashlytics'**
  String get crashlytics;

  /// No description provided for @crashlyticsPage.
  ///
  /// In en, this message translates to:
  /// **'Crashlytics Page'**
  String get crashlyticsPage;

  /// No description provided for @crashlyticsTestCrash.
  ///
  /// In en, this message translates to:
  /// **'Crashlytics test crash!'**
  String get crashlyticsTestCrash;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account with email and password'**
  String get createAccount;

  /// No description provided for @debug.
  ///
  /// In en, this message translates to:
  /// **' - debug'**
  String get debug;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccountConfirm;

  /// No description provided for @deleteAccountDialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get deleteAccountDialog;

  /// No description provided for @demoPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Demo Page'**
  String get demoPageTitle;

  /// No description provided for @disconnectedFromANetwork.
  ///
  /// In en, this message translates to:
  /// **'Disconnected from a network'**
  String get disconnectedFromANetwork;

  /// No description provided for @disconnectedFromTheInternet.
  ///
  /// In en, this message translates to:
  /// **'Disconnected from the internet'**
  String get disconnectedFromTheInternet;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterAValidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get enterAValidEmailAddress;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get enterYourPassword;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to settings'**
  String get goToSettings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageCzech.
  ///
  /// In en, this message translates to:
  /// **'Czech'**
  String get languageCzech;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageName;

  /// No description provided for @lastSignInTime.
  ///
  /// In en, this message translates to:
  /// **'Last Sign In Time: {date}'**
  String lastSignInTime(DateTime date);

  /// No description provided for @localization.
  ///
  /// In en, this message translates to:
  /// **'Localizations'**
  String get localization;

  /// No description provided for @loggedIn.
  ///
  /// In en, this message translates to:
  /// **'Logged in: {bool}'**
  String loggedIn(String bool);

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @noThankYou.
  ///
  /// In en, this message translates to:
  /// **'No, thank you'**
  String get noThankYou;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordMustBeAtLeast6CharactersLong.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get passwordMustBeAtLeast6CharactersLong;

  /// No description provided for @providerId.
  ///
  /// In en, this message translates to:
  /// **'Provider ID: {id}'**
  String providerId(String id);

  /// No description provided for @providerTestPage.
  ///
  /// In en, this message translates to:
  /// **'Provider Test Page'**
  String get providerTestPage;

  /// No description provided for @remoteConfig.
  ///
  /// In en, this message translates to:
  /// **'Remote Config'**
  String get remoteConfig;

  /// No description provided for @requestNotificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Request Notification Permission'**
  String get requestNotificationPermission;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @routingGoToDetailDetail.
  ///
  /// In en, this message translates to:
  /// **'Go to Detail Detail'**
  String get routingGoToDetailDetail;

  /// No description provided for @routingGoToDetailPage.
  ///
  /// In en, this message translates to:
  /// **'Go to Detail Page'**
  String get routingGoToDetailPage;

  /// No description provided for @routingGoToParamDetailPage.
  ///
  /// In en, this message translates to:
  /// **'Go to Param Detail Page'**
  String get routingGoToParamDetailPage;

  /// No description provided for @routingParamDetailPageDetail.
  ///
  /// In en, this message translates to:
  /// **'Routing Param Detail Page'**
  String get routingParamDetailPageDetail;

  /// No description provided for @routingParamDetailPageDetail1.
  ///
  /// In en, this message translates to:
  /// **'This is a routing param detail page.'**
  String get routingParamDetailPageDetail1;

  /// No description provided for @routingParamDetailPageDetail2.
  ///
  /// In en, this message translates to:
  /// **'It is used to test routing with parameters.'**
  String get routingParamDetailPageDetail2;

  /// No description provided for @routingParamDetailPageDetail3.
  ///
  /// In en, this message translates to:
  /// **'Film ID: {filmId}'**
  String routingParamDetailPageDetail3(String filmId);

  /// No description provided for @routingParamFilmId.
  ///
  /// In en, this message translates to:
  /// **'Path param Film ID'**
  String get routingParamFilmId;

  /// No description provided for @routingParamPage.
  ///
  /// In en, this message translates to:
  /// **'Routing Param Page'**
  String get routingParamPage;

  /// No description provided for @routingParamPageDetail.
  ///
  /// In en, this message translates to:
  /// **'This is a routing param page.'**
  String get routingParamPageDetail;

  /// No description provided for @routingParamPageDetail2.
  ///
  /// In en, this message translates to:
  /// **'It is used to test routing with parameters.'**
  String get routingParamPageDetail2;

  /// No description provided for @routingParamQueryFilmId.
  ///
  /// In en, this message translates to:
  /// **'Query param Film ID'**
  String get routingParamQueryFilmId;

  /// No description provided for @routingTestDetailDetail.
  ///
  /// In en, this message translates to:
  /// **'Routing Test Detail Detail'**
  String get routingTestDetailDetail;

  /// No description provided for @routingTestDetailDetailText.
  ///
  /// In en, this message translates to:
  /// **'This is a routing test detail detail page.'**
  String get routingTestDetailDetailText;

  /// No description provided for @routingTestPage.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get routingTestPage;

  /// No description provided for @routingTestPageDetail.
  ///
  /// In en, this message translates to:
  /// **'This is a routing test page.'**
  String get routingTestPageDetail;

  /// No description provided for @routingTestPageDetail1.
  ///
  /// In en, this message translates to:
  /// **'It is used to test routing.'**
  String get routingTestPageDetail1;

  /// No description provided for @secret.
  ///
  /// In en, this message translates to:
  /// **'secret'**
  String get secret;

  /// No description provided for @secretGoogle.
  ///
  /// In en, this message translates to:
  /// **'secret Google'**
  String get secretGoogle;

  /// No description provided for @secretGoogleContent.
  ///
  /// In en, this message translates to:
  /// **'Flutter + Google = ❤️'**
  String get secretGoogleContent;

  /// No description provided for @secretPage.
  ///
  /// In en, this message translates to:
  /// **'Secret Page'**
  String get secretPage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @showLocale.
  ///
  /// In en, this message translates to:
  /// **'Show locale'**
  String get showLocale;

  /// No description provided for @signInAnonymously.
  ///
  /// In en, this message translates to:
  /// **'Sign in Anonymously'**
  String get signInAnonymously;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign in with email and password'**
  String get signInWithEmailAndPassword;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @userDisplayName.
  ///
  /// In en, this message translates to:
  /// **'User Display Name: {name}'**
  String userDisplayName(String name);

  /// No description provided for @userEmail.
  ///
  /// In en, this message translates to:
  /// **'User Email: {email}'**
  String userEmail(String email);

  /// No description provided for @userEmailVerified.
  ///
  /// In en, this message translates to:
  /// **'User Email Verified: {bool}'**
  String userEmailVerified(String bool);

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'User ID: {id}'**
  String userId(String id);

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get verifyEmail;
}

class _TextsDelegate extends LocalizationsDelegate<Texts> {
  const _TextsDelegate();

  @override
  Future<Texts> load(Locale locale) {
    return SynchronousFuture<Texts>(lookupTexts(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['cs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_TextsDelegate old) => false;
}

Texts lookupTexts(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return TextsCs();
    case 'en':
      return TextsEn();
  }

  throw FlutterError(
      'Texts.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
