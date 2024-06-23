// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyARLbCza3INmFGD3P62q7Bl0H_Hag_Ndzg',
    appId: '1:466976066624:web:0b4bcf6c4676903e5423a5',
    messagingSenderId: '466976066624',
    projectId: 'app-elevate-core',
    authDomain: 'app-elevate-core.firebaseapp.com',
    storageBucket: 'app-elevate-core.appspot.com',
    measurementId: 'G-FQYVCRF8T9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdSDmDUCZGXYmdKo13eLD02mhe3FGdsug',
    appId: '1:466976066624:android:804f4c712efa78d15423a5',
    messagingSenderId: '466976066624',
    projectId: 'app-elevate-core',
    storageBucket: 'app-elevate-core.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBu_bCobnJpHaCDMFNJ2LdbK5jTnu7LWn8',
    appId: '1:466976066624:ios:f24268d71912ecfe5423a5',
    messagingSenderId: '466976066624',
    projectId: 'app-elevate-core',
    storageBucket: 'app-elevate-core.appspot.com',
    iosBundleId: 'cz.appelevate.core',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBu_bCobnJpHaCDMFNJ2LdbK5jTnu7LWn8',
    appId: '1:466976066624:ios:f24268d71912ecfe5423a5',
    messagingSenderId: '466976066624',
    projectId: 'app-elevate-core',
    storageBucket: 'app-elevate-core.appspot.com',
    iosBundleId: 'cz.appelevate.core',
  );

}