import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/logic/login/apple_sign_in_logic.dart';
import 'package:coree/src/logic/login/email_sign_in_logic.dart';
import 'package:coree/src/logic/login/google_sign_in_logic.dart';
import 'package:coree/src/logic/login/login_logic.dart';
import 'package:coree/src/ui/widgets/login_form_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onResult, this.providerId});

  final Function(User?)? onResult;
  final String? providerId;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamSubscription<User?>? _authStateChanges;

  @override
  void initState() {
    _authStateChanges ??= FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else if (widget.onResult != null) {
        for (var element in user.providerData) {
          debugPrint(element.providerId);
        }
        debugPrint('User is signed in!');
        if (widget.providerId != null && user.providerData.any((element) => element.providerId == widget.providerId)) {
          widget.onResult!(user);
        } else if (widget.providerId == null) {
          widget.onResult!(user);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    unawaited(_authStateChanges?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop && widget.onResult != null) {
          widget.onResult!(null);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.login),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async => context.router.navigate(const SettingsPage()),
                child: Text(l10n.goToSettings),
              ),
              ElevatedButton(
                onPressed: () async => FirebaseAuth.instance.signInAnonymously(),
                child: Text(l10n.signInAnonymously),
              ),
              ElevatedButton(
                onPressed: () async => kIsWeb ? handleSignInWeb() : handleGoogleSignInNative(),
                child: Text(l10n.signInWithGoogle),
              ),
              ElevatedButton(
                onPressed: () async => handleSignInWithApple(),
                child: Text(l10n.signInWithApple),
              ),
              ElevatedButton(
                onPressed: () async => handleAccountDeletion(),
                child: Text(l10n.deleteAccount),
              ),
              ElevatedButton(
                onPressed: () async => handleEmailVerification(),
                child: Text(l10n.verifyEmail),
              ),
              ElevatedButton(onPressed: () async => handleSignOut(), child: Text(l10n.signOut)),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
