import 'package:intl/intl.dart' as intl;

import 'texts.dart';

/// The translations for English (`en`).
class TextsEn extends Texts {
  TextsEn([String locale = 'en']) : super(locale);

  @override
  String get accountStatus => 'Account Status';

  @override
  String accountcreationTime(DateTime date) {
    final intl.DateFormat dateDateFormat =
        intl.DateFormat.yMMMMEEEEd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Account Creation Time: $dateString';
  }

  @override
  String get appDescription =>
      'Application that is the basis for other applications.';

  @override
  String get appName => 'Autojídelna';

  @override
  String get appleSecret => 'Apple Femboy Secret';

  @override
  String get appleSecretContent => 'Flutter + Apple = ❤️';

  @override
  String get buttonPushed => 'You have pushed the button this many times:';

  @override
  String get connectedToANetwork => 'Connected to a network';

  @override
  String get connectedToTheInternet => 'Connected to the internet';

  @override
  String get counting => 'Counting';

  @override
  String get crashlytics => 'Crashlytics';

  @override
  String get crashlyticsPage => 'Crashlytics Page';

  @override
  String get crashlyticsTestCrash => 'Crashlytics test crash!';

  @override
  String get createAccount => 'Create account with email and password';

  @override
  String get debug => ' - debug';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountConfirm => 'Delete account';

  @override
  String get deleteAccountDialog =>
      'Are you sure you want to delete your account?';

  @override
  String get demoPageTitle => 'Demo Page';

  @override
  String get disconnectedFromANetwork => 'Disconnected from a network';

  @override
  String get disconnectedFromTheInternet => 'Disconnected from the internet';

  @override
  String get email => 'Email';

  @override
  String get enterAValidEmailAddress => 'Please enter a valid email address';

  @override
  String get enterYourEmail => 'Please enter your email';

  @override
  String get enterYourPassword => 'Please enter your password';

  @override
  String get goBack => 'Go back';

  @override
  String get goToSettings => 'Go to settings';

  @override
  String get language => 'Language';

  @override
  String get languageCzech => 'Czech';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageName => 'English';

  @override
  String lastSignInTime(DateTime date) {
    final intl.DateFormat dateDateFormat =
        intl.DateFormat.yMMMMEEEEd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Last Sign In Time: $dateString';
  }

  @override
  String get localization => 'Localizations';

  @override
  String loggedIn(String bool) {
    return 'Logged in: $bool';
  }

  @override
  String get login => 'Login';

  @override
  String get noThankYou => 'No, thank you';

  @override
  String get password => 'Password';

  @override
  String get passwordMustBeAtLeast6CharactersLong =>
      'Password must be at least 6 characters long';

  @override
  String get patch => 'patch';

  @override
  String providerId(String id) {
    return 'Provider ID: $id';
  }

  @override
  String get remoteConfig => 'Remote Config';

  @override
  String get requestNotificationPermission => 'Request Notification Permission';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get routingGoToDetailDetail => 'Go to Detail Detail';

  @override
  String get routingGoToDetailPage => 'Go to Detail Page';

  @override
  String get routingGoToParamDetailPage => 'Go to Param Detail Page';

  @override
  String get routingParamDetailPageDetail => 'Routing Param Detail Page';

  @override
  String get routingParamDetailPageDetail1 =>
      'This is a routing param detail page.';

  @override
  String get routingParamDetailPageDetail2 =>
      'It is used to test routing with parameters.';

  @override
  String routingParamDetailPageDetail3(String filmId) {
    return 'Film ID: $filmId';
  }

  @override
  String get routingParamFilmId => 'Path param Film ID';

  @override
  String get routingParamPage => 'Routing Param Page';

  @override
  String get routingParamPageDetail => 'This is a routing param page.';

  @override
  String get routingParamPageDetail2 =>
      'It is used to test routing with parameters.';

  @override
  String get routingParamQueryFilmId => 'Query param Film ID';

  @override
  String get routingTestDetailDetail => 'Routing Test Detail Detail';

  @override
  String get routingTestDetailDetailText =>
      'This is a routing test detail detail page.';

  @override
  String get routingTestPage => 'Settings';

  @override
  String get routingTestPageDetail => 'This is a routing test page.';

  @override
  String get routingTestPageDetail1 => 'It is used to test routing.';

  @override
  String get secret => 'secret';

  @override
  String get secretGoogle => 'secret Google';

  @override
  String get secretGoogleContent => 'Flutter + Google = ❤️';

  @override
  String get secretPage => 'Secret Page';

  @override
  String get settings => 'Settings';

  @override
  String get showLocale => 'Show locale';

  @override
  String get signInAnonymously => 'Sign in Anonymously';

  @override
  String get signInWithApple => 'Sign in with Apple';

  @override
  String get signInWithEmailAndPassword => 'Sign in with email and password';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signOut => 'Sign out';

  @override
  String get typeCrash => 'Type \"crash\" to crash the app';

  @override
  String userDisplayName(String name) {
    return 'User Display Name: $name';
  }

  @override
  String userEmail(String email) {
    return 'User Email: $email';
  }

  @override
  String userEmailVerified(String bool) {
    return 'User Email Verified: $bool';
  }

  @override
  String userId(String id) {
    return 'User ID: $id';
  }

  @override
  String get verifyEmail => 'Verify email';
}
