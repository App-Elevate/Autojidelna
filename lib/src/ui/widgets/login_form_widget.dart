import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/_auth/email_sign_in_logic.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
  build(BuildContext context) {
    final lang = context.l10n;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: lang.email),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lang.enterYourEmail;
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return lang.enterAValidEmailAddress;
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: lang.password),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lang.enterYourPassword;
              }
              if (value.length < 7) {
                return lang.passwordMustBeAtLeast6CharactersLong;
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handleEmailSignIn(_emailController.text, _passwordController.text) : null,
            child: Text(lang.signInWithEmailAndPassword),
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handleEmailRegister(_emailController.text, _passwordController.text) : null,
            child: Text(lang.createAccount),
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handlePasswordReset(_emailController.text) : null,
            child: Text(lang.resetPassword),
          ),
        ],
      ),
    );
  }
}
