import 'package:coree/src/lang/lang.dart';
import 'package:coree/src/logic/login/email_sign_in_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
    return Form(
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
            onPressed: () async => _formKey.currentState!.validate() ? handleEmailSignIn(_emailController.text, _passwordController.text) : null,
            child: Text(Alocale.signInWithEmailAndPassword.getString(context)),
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handleEmailRegister(_emailController.text, _passwordController.text) : null,
            child: Text(Alocale.createAccount.getString(context)),
          ),
          ElevatedButton(
            onPressed: () async => _formKey.currentState!.validate() ? handlePasswordReset(_emailController.text) : null,
            child: Text(Alocale.resetPassword.getString(context)),
          ),
        ],
      ),
    );
  }
}
