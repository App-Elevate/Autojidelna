import 'package:coree/src/_conf/secure_storage.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/logic/login/apple_sign_in_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> handleSignOut() async {
  if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.providerData.any((element) => element.providerId == 'google.com')) {
    await App.googleSignIn.signOut();
  }
  if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.providerData.any((element) => element.providerId == 'apple.com')) {
    App.secureStorage.delete(key: FlutterSecureStorageKeys.appleAuthKey, iOptions: FlutterSecureStorageKeys.options);
  }
  await FirebaseAuth.instance.signOut();
}

Future<void> handleAccountDeletion() async {
  if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.providerData.any((element) => element.providerId == 'google.com')) {
    await App.googleSignIn.disconnect();
  }
  if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.providerData.any((element) => element.providerId == 'apple.com')) {
    await revokeTokenApple();
  }
  await FirebaseAuth.instance.currentUser?.delete();
}
