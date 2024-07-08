import 'package:coree/src/_conf/analytics.dart';
import 'package:coree/src/_global/remote_config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> appElevateClick() async {
  FirebaseAnalytics.instance.logEvent(
    name: AnalyticsNames.appElevateClicked,
    parameters: {AnalyticsParam.place: AnalyticsPlace.aboutDialog, AnalyticsParam.sponsor: Rmc.value[Rmc.appelevateLink]},
  );
  await launchUrl(Uri.parse(Rmc.value[Rmc.appelevateLink]));
}
