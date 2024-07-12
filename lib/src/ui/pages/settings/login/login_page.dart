import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/logic/apple_sign_in_logic.dart';
import 'package:coree/src/logic/email_sign_in_logic.dart';
import 'package:coree/src/logic/google_sign_in_logic.dart';
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
              ElevatedButton(
                onPressed: () async => verifyEmail(),
                child: const Text('Verify Email'),
              ),
              ElevatedButton(onPressed: () async => handleSignOut(), child: const Text('Sign out')),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async =>
                          _formKey.currentState!.validate() ? handleEmailSignIn(_emailController.text, _passwordController.text) : null,
                      child: const Text('Sign in with email and password'),
                    ),
                    ElevatedButton(
                      onPressed: () async =>
                          _formKey.currentState!.validate() ? handleEmailRegister(_emailController.text, _passwordController.text) : null,
                      child: const Text('Create account with email and password'),
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
