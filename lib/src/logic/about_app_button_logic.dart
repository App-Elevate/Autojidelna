import 'package:coree/src/conf/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> appElevateClick() async {
  FirebaseAnalytics.instance.logEvent(
    name: AnalyticsNames.appElevateClicked,
    parameters: {AnalyticsParam.place: AnalyticsPlace.aboutDialog, AnalyticsParam.sponsor: 'https://appelevate.cz/'},
  );
  await launchUrl(Uri.parse('https://appelevate.cz/'));
}
