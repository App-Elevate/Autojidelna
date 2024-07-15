import 'package:coree/src/_global/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Handles the sign in with Google on iOS or Android.
Future<UserCredential?> handleGoogleSignInNative() async {
  try {
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
  } catch (e) {
    return null;
  }
}

/// Handles the sign in with Google on the web.
Future<UserCredential?> handleSignInWeb() async {
  try {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  } catch (e) {
    return null;
  }
}