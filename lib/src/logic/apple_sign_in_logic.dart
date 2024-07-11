import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<UserCredential?> signInWithApple() async {
  try {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      return await FirebaseAuth.instance.signInWithPopup(appleProvider);
    } else {
      return await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }
  } catch (e) {
    return null;
  }
}

Future<void> revokeTokenApple() async {
  UserCredential userCredential = (await signInWithApple())!;
  // Keep the authorization code returned from Apple platforms
  String? authCode = userCredential.additionalUserInfo?.authorizationCode;
  // Revoke Apple auth token
  await FirebaseAuth.instance.revokeTokenWithAuthorizationCode(authCode!);
}
