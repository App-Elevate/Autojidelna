import 'package:coree/src/_conf/secure_storage.dart';
import 'package:coree/src/_global/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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
    await App.secureStorage.write(key: FlutterSecureStorageKeys.appleAuthKey, value: authCode, iOptions: FlutterSecureStorageKeys.options);
  }
  return userCredential;
}

Future<void> revokeTokenApple() async {
  // Keep the authorization code returned from Apple platforms
  String? authCode = await App.secureStorage.read(key: FlutterSecureStorageKeys.appleAuthKey, iOptions: FlutterSecureStorageKeys.options);

  authCode ??= (await handleSignInWithApple())?.additionalUserInfo?.authorizationCode;

  if (authCode == null) return;
  // Revoke Apple auth token
  await FirebaseAuth.instance.revokeTokenWithAuthorizationCode(authCode);
  await App.secureStorage.delete(key: FlutterSecureStorageKeys.appleAuthKey, iOptions: FlutterSecureStorageKeys.options);
}
