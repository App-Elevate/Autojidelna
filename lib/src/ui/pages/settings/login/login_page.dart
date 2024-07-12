import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:coree/src/logic/apple_sign_in_logic.dart';
import 'package:coree/src/logic/email_sign_in_logic.dart';
import 'package:coree/src/logic/google_sign_in_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onResult, this.providerId});

  final Function(User?)? onResult;
  final String? providerId;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
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
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop && widget.onResult != null) {
          widget.onResult!(null);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(Alocale.login.getString(context)),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async => context.router.navigate(const SettingsPage()),
                child: Text(Alocale.goToSettings.getString(context)),
              ),
              ElevatedButton(
                onPressed: () async => FirebaseAuth.instance.signInAnonymously(),
                child: Text(Alocale.signInAnonymously.getString(context)),
              ),
              ElevatedButton(
                onPressed: () async => kIsWeb ? handleSignInWeb() : handleSignInNative(),
                child: Text(Alocale.signInWithGoogle.getString(context)),
              ),
              ElevatedButton(
                onPressed: () async => signInWithApple(),
                child: Text(Alocale.signInWithApple.getString(context)),
              ),
              ElevatedButton(
                onPressed: () async => revokeTokenApple(),
                child: Text(Alocale.revokeTokenApple.getString(context)),
              ),
              ElevatedButton(
                onPressed: () async => verifyEmail(),
                child: Text(Alocale.verifyEmail.getString(context)),
              ),
              ElevatedButton(onPressed: () async => handleSignOut(), child: Text(Alocale.signOut.getString(context))),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: Alocale.email.getString(context)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Alocale.enterYourEmail.getString(context);
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return Alocale.enterAValidEmailAddress.getString(context);
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: Alocale.password.getString(context)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Alocale.enterYourPassword.getString(context);
                        }
                        if (value.length < 6) {
                          return Alocale.passwordMustBeAtLeast6CharactersLong.getString(context);
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async =>
                          _formKey.currentState!.validate() ? handleEmailSignIn(_emailController.text, _passwordController.text) : null,
                      child: Text(Alocale.signInWithEmailAndPassword.getString(context)),
                    ),
                    ElevatedButton(
                      onPressed: () async =>
                          _formKey.currentState!.validate() ? handleEmailRegister(_emailController.text, _passwordController.text) : null,
                      child: Text(Alocale.createAccount.getString(context)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
