/// Names of analytics events
class AnalyticsNames {
  static const String appElevateClicked = 'app_elevate';
}

/// Parameters used across analytics events
///
/// If you create a new parameter, make sure to add it to dimensions in Firebase Analytics
class AnalyticsParam {
  static const String place = 'place';
  static const String sponsor = 'sponsor';
}

/// Places where analytics events are logged
class AnalyticsPlace {
  static const String aboutDialog = 'about_dialog';
}
