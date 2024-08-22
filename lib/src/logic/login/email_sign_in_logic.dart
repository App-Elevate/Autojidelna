import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Handles email sign in.
///
/// This will sign in the user with email and password.
Future<UserCredential?> handleEmailSignIn(String email, String password) async {
  try {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      debugPrint('Wrong password provided for that user.');
    } else if (e.code == 'invalid-credential') {
      debugPrint('Wrong password provided for that user.');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

/// Handles email registration.
///
/// This will register the user with email and password.
Future<UserCredential?> handleEmailRegister(String email, String password) async {
  try {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

/// Handles a request to reset the password.
Future<void> handlePasswordReset(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

/// Handles email verification.
///
/// This will send an email verification to the user.
Future<void> handleEmailVerification() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null && !user.emailVerified && user.email != null) {
    await user.sendEmailVerification();
  }
}
