import 'package:coree/firebase_options.dart';
import 'package:coree/src/_global/init_app.dart';
import 'package:coree/src/ui/material_app.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // We don't want to send crash reports while in development. Web is not supported yet by Crashlytics.
  if (!kDebugMode && !kProfileMode && !kIsWeb) {
    // Flutter error handling
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  await FirebaseAppCheck.instance.activate(
    // this is also an option: ReCaptchaV3Provider('6LdNRA0qAAAAABvSy9wAVVjdlhcbuXTasRoK6Z4h')
    webProvider: ReCaptchaEnterpriseProvider('6LcZHQ0qAAAAAMDHZjUfWBOkvKR_eqxFixd7WeR7'),
    androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttestWithDeviceCheckFallback,
  );

  await InitApp.initConf();

  runApp(const MyAppWrapper());
}
