import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// This is a test function that will crash the app.
void crashTestFunction() async {
  if (kIsWeb) {
    try {
      throw StateError('Crash WEB');
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    return;
  }
  throw StateError('Crash native');
}
