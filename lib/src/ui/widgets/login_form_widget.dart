import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/logic/login/email_sign_in_logic.dart';
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
    final l10n = context.l10n;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: l10n.email),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.enterYourEmail;
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return l10n.enterAValidEmailAddress;
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: l10n.password),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.enterYourPassword;
              }
              if (value.length < 7) {
                return l10n.passwordMustBeAtLeast6CharactersLong;
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handleEmailSignIn(_emailController.text, _passwordController.text) : null,
            child: Text(l10n.signInWithEmailAndPassword),
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handleEmailRegister(_emailController.text, _passwordController.text) : null,
            child: Text(l10n.createAccount),
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handlePasswordReset(_emailController.text) : null,
            child: Text(l10n.resetPassword),
          ),
        ],
      ),
    );
  }
}
