// Purpose: Login screen for the app

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  // Static is fix for keyboard disapearing when this screen is pushed (problem with rebuilding the widget)
  static final _formKey = GlobalKey<FormState>();
  // Without static the text in the textfields would be deleted for the same reasons.
  static final _usernameController = TextEditingController();
  static final _passwordController = TextEditingController();
  static final _urlController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// First value is error text, second is if it the password is visible
  final ValueNotifier<List<dynamic>> passwordNotifier = ValueNotifier([null, false]);

  final ValueNotifier<String?> urlErrorText = ValueNotifier(null);

  final ValueNotifier<bool> loggingIn = ValueNotifier(false);
  @override
  void initState() {
    setLastUrl();
    LoginPage._usernameController.text = '';
    LoginPage._passwordController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return formScaffold(context, lang);
  }

  Scaffold formScaffold(BuildContext context, Texts lang) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).appBarTheme.iconTheme?.copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppBar().preferredSize.height),
                child: Text(
                  lang.appName,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              loginForm(context, lang),
            ],
          ),
        ),
      ),
    );
  }

  void _setErrorText(String text, LoginFormErrorField? field) {
    switch (field) {
      case LoginFormErrorField.password:
        passwordNotifier.value = [text, passwordNotifier.value[1]];
        urlErrorText.value = null;
        break;
      case LoginFormErrorField.url:
        urlErrorText.value = text;
        passwordNotifier.value = [null, passwordNotifier.value[1]];
        break;
      default:
        urlErrorText.value = null;
        passwordNotifier.value = [null, passwordNotifier.value[1]];
    }
  }

  void setLastUrl() async {
    LoginPage._urlController.text = Hive.box(Boxes.appState).get(HiveKeys.url, defaultValue: '');
  }

  Form loginForm(context, Texts lang) {
    return Form(
      key: LoginPage._formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ValueListenableBuilder(
                valueListenable: urlErrorText,
                builder: (ctx, value, child) {
                  return TextFormField(
                    controller: LoginPage._urlController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: lang.loginUrlFieldLabel,
                      errorText: value,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return lang.loginUrlFieldHint;
                      return null;
                    },
                  );
                },
              ),
            ),
            AutofillGroup(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      autofillHints: const [AutofillHints.username],
                      controller: LoginPage._usernameController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      decoration: InputDecoration(labelText: lang.loginUserFieldLabel),
                      validator: (value) {
                        if (value == null || value.isEmpty) return lang.loginUserFieldHint;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ValueListenableBuilder(
                      valueListenable: passwordNotifier,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: LoginPage._passwordController,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.password],
                          obscureText: value[1] ? false : true,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: lang.loginPasswordFieldLabel,
                            errorText: value[0],
                            suffixIcon: IconButton(
                              onPressed: () => passwordNotifier.value = [passwordNotifier.value[0], !passwordNotifier.value[1]],
                              icon: Icon(value[1] ? Icons.visibility : Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) return lang.loginPasswordFieldHint;
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            loginSubmitButton(context, lang),
            RichText(
              text: TextSpan(
                text: lang.dataCollectionAgreement,
                style: AppThemes.textTheme.bodySmall!.copyWith(color: Theme.of(context).dividerColor),
                children: [
                  TextSpan(
                    text: lang.moreInfo,
                    style: AppThemes.textTheme.bodySmall!.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        unawaited(context.router.push(const AnalyticsPage()));
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container loginSubmitButton(context, Texts lang) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      width: 400,
      child: ValueListenableBuilder(
        valueListenable: loggingIn,
        builder: (context, value, child) {
          return FilledButton(
            onPressed: value ? null : () => loginFieldCheck(context, lang),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
            child: value ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary) : Text(lang.loginButton),
          );
        },
      ),
    );
  }

  void loginFieldCheck(BuildContext context, Texts lang) async {
    if (LoginPage._formKey.currentState!.validate()) {
      // If the form is valid, save the form fields.
      LoginPage._formKey.currentState!.save();
      _setErrorText('', null);
      loggingIn.value = true;
      String url = LoginPage._urlController.text;
      try {
        await loggedInCanteen.addAccount(LoginPage._urlController.text, LoginPage._usernameController.text, LoginPage._passwordController.text);
        Hive.box(Boxes.appState).put(HiveKeys.url, url);
      } catch (e) {
        switch (e) {
          case ConnectionErrors.noInternet:
            _setErrorText(lang.errorsNoInternet, LoginFormErrorField.url);
            break;
          case ConnectionErrors.wrongUrl:
            _setErrorText(lang.errorsBadUrl, LoginFormErrorField.url);
            break;
          case ConnectionErrors.badLogin:
            _setErrorText(lang.errorsBadLogin, LoginFormErrorField.password);
            break;
          default:
            _setErrorText(lang.errorsBadConnection, LoginFormErrorField.url);
            break;
        }
      }
      loggingIn.value = false;
    }
  }
}
