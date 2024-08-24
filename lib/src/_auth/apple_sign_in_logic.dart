import 'package:coree/src/_conf/secure_storage.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/_auth/login_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Handles the sign in with Apple. This will sign in the user with Apple and store the authorization code.
Future<UserCredential?> handleSignInWithApple() async {
  late final UserCredential userCredential;
  try {
    final appleProvider = AppleAuthProvider();
    appleProvider.addScope('email');
    appleProvider.addScope('name');
    if (kIsWeb) {
      userCredential = await FirebaseAuth.instance.signInWithPopup(appleProvider);
    } else {
      userCredential = await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }
  } catch (e) {
    return null;
  }
  String? authCode = userCredential.additionalUserInfo?.authorizationCode;
  if (authCode != null) {
    await App.secureStorage.write(key: SecureStorage.appleAuthKey, value: authCode, iOptions: SecureStorage.options);
  }
  return userCredential;
}

/// Revokes the Apple sign in token and signs out the user.
///
/// This unlinks the Apple sign in from the Firebase user.
Future<void> revokeTokenApple() async {
  // Keep the authorization code returned from Apple platforms
  String? authCode = await App.secureStorage.read(key: SecureStorage.appleAuthKey, iOptions: SecureStorage.options);

  authCode ??= (await handleSignInWithApple())?.additionalUserInfo?.authorizationCode;

  if (authCode == null) return;
  // Revoke Apple auth token
  try {
    await FirebaseAuth.instance.revokeTokenWithAuthorizationCode(authCode);
  } catch (e) {
    // This might happen if the token is already revoked or the token is expired
  }
  await handleSignOut();
  await App.secureStorage.delete(key: SecureStorage.appleAuthKey, iOptions: SecureStorage.options);
}
