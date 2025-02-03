// Purpose: Login screen for the app

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/types/password_state.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

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
  final ValueNotifier<PasswordState> passwordNotifier = ValueNotifier(const PasswordState(errorText: null, isVisible: false));
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
    final Texts lang = context.l10n;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(forceMaterialTransparency: true),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Text(lang.appName, style: AppThemes.textTheme.displayLarge),
            ),
            loginForm(context, lang),
          ],
        ),
      ),
    );
  }

  void _setErrorText(String text, LoginFormErrorField? field) {
    PasswordState state = passwordNotifier.value;
    switch (field) {
      case LoginFormErrorField.password:
        passwordNotifier.value = state.copyWith(errorText: text);
        urlErrorText.value = null;
        break;
      case LoginFormErrorField.url:
        urlErrorText.value = text;
        passwordNotifier.value = state.copyWith(errorText: text);
        break;
      default:
        urlErrorText.value = null;
        passwordNotifier.value = state.copyWith(errorText: text);
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
                builder: (_, errorText, ___) {
                  return TextFormField(
                    controller: LoginPage._urlController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.url],
                    decoration: InputDecoration(labelText: lang.loginUrlFieldLabel, errorText: errorText),
                    validator: (value) => value == null || value.isEmpty ? lang.loginUrlFieldHint : null,
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
                      controller: LoginPage._usernameController,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.username],
                      decoration: InputDecoration(labelText: lang.loginUserFieldLabel),
                      validator: (value) => value == null || value.isEmpty ? lang.loginUserFieldHint : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ValueListenableBuilder(
                      valueListenable: passwordNotifier,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: LoginPage._passwordController,
                          autocorrect: false,
                          obscureText: !value.isVisible,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: lang.loginPasswordFieldLabel,
                            errorText: value.errorText,
                            suffixIcon: IconButton(
                              onPressed: () => passwordNotifier.value = value.copyWith(isVisible: !value.isVisible),
                              icon: Icon(value.isVisible ? Icons.visibility : Icons.visibility_off),
                            ),
                          ),
                          validator: (value) => value == null || value.isEmpty ? lang.loginPasswordFieldHint : null,
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
                    recognizer: TapGestureRecognizer()..onTap = () async => context.router.navigate(const AnalyticsPage()),
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
      width: 400,
      child: ValueListenableBuilder(
        valueListenable: loggingIn,
        builder: (context, loggingIn, __) {
          return FilledButton(
            onPressed: loggingIn ? null : () => loginFieldCheck(context, lang),
            child: loggingIn ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary) : Text(lang.login),
          );
        },
      ),
    );
  }

  void loginFieldCheck(BuildContext context, Texts lang) async {
    if (!LoginPage._formKey.currentState!.validate()) return;

    // If the form is valid, save the form fields.
    LoginPage._formKey.currentState!.save();
    _setErrorText('', null);
    loggingIn.value = true;
    final Account account = Account(
      username: LoginPage._usernameController.text,
      password: LoginPage._passwordController.text,
      url: LoginPage._urlController.text,
    );
    try {
      await context.read<UserProvider>().login(account);
      Hive.box(Boxes.appState).put(HiveKeys.url, LoginPage._urlController.text);
      if (context.mounted) context.router.replaceAll([const RouterPage()], updateExistingRoutes: false);
    } catch (e) {
      switch (e) {
        case AuthErrors.noInternetConnection:
          bool value = await showInternetConnectionSnackBar();
          if (value && context.mounted) loginFieldCheck(context, lang);
          break;
        default:
      }
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
