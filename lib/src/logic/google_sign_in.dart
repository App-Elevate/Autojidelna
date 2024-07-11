import 'package:coree/src/_global/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> handleSignInNative() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await App.googleSignIn.signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> handleSignOut() async {
  await App.googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();
}

Future<UserCredential?> handleSignInWeb() async {
  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}
