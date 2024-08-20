import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// This is a test function that will crash the app.
void crashlyticsTestFunction() async {
  if (kIsWeb) {
    try {
      throw StateError('HEY SENTRY WEB');
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    return;
  }
  throw StateError('HEY SENTRY');
}
