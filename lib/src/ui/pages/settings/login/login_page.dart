import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/logic/apple_sign_in_logic.dart';
import 'package:coree/src/logic/google_sign_in_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onResult, this.providerId});

  final Function(User?)? onResult;
  final String? providerId;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else if (onResult != null) {
        for (var element in user.providerData) {
          debugPrint(element.providerId);
        }
        debugPrint('User is signed in!');
        if (providerId != null && user.providerData.any((element) => element.providerId == providerId)) {
          onResult!(user);
        }
      }
    });
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop && onResult != null) {
          onResult!(null);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async => context.router.navigate(const SettingsPage()),
                child: const Text('Go to settings'),
              ),
              ElevatedButton(
                onPressed: () async => FirebaseAuth.instance.signInAnonymously(),
                child: const Text('Sign in Anonymously'),
              ),
              ElevatedButton(
                onPressed: () async => kIsWeb ? handleSignInWeb() : handleSignInNative(),
                child: const Text('Sign in to Google'),
              ),
              ElevatedButton(
                onPressed: () async => signInWithApple(),
                child: const Text('Sign in with Apple'),
              ),
              ElevatedButton(
                onPressed: () async => revokeTokenApple(),
                child: const Text('Revoke Apple token'),
              ),
              ElevatedButton(onPressed: () async => handleSignOut(), child: const Text('Sign out')),
            ],
          ),
        ),
      ),
    );
  }
}
