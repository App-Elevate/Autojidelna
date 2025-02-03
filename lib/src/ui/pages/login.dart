// Purpose: Login screen for the app

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
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
  final ValueNotifier<bool> usernameErrorState = ValueNotifier(false);
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

  void _setErrorText(String? text, LoginFormErrorField? field) {
    PasswordState state = passwordNotifier.value;
    switch (field) {
      case LoginFormErrorField.credentials:
        urlErrorText.value = null;
        usernameErrorState.value = true;
        passwordNotifier.value = state.copyWith(errorText: text);
        break;
      case LoginFormErrorField.url:
        urlErrorText.value = text;
        usernameErrorState.value = false;
        passwordNotifier.value = state.copyWith(errorText: text);
        break;
      default:
        urlErrorText.value = null;
        usernameErrorState.value = false;
        passwordNotifier.value = state.copyWith(errorText: null);
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
                    child: ValueListenableBuilder(
                      valueListenable: usernameErrorState,
                      builder: (context, errorState, _) {
                        return TextFormField(
                          controller: LoginPage._usernameController,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.username],
                          decoration: InputDecoration(labelText: lang.loginUserFieldLabel, error: errorState ? const SizedBox() : null),
                          validator: (value) {
                            String? validator;
                            if (value != null && value.isNotEmpty) return validator;
                            if (!errorState) return lang.loginUserFieldHint;
                            return validator;
                          },
                        );
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
    _setErrorText(null, null);
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
        case AuthErrors.wrongCredentials:
          _setErrorText(lang.errorsWrongCredentialsTextField, LoginFormErrorField.credentials);
          break;
        case AuthErrors.wrongUrl:
          _setErrorText(lang.errorsWrongUrl, LoginFormErrorField.url);
          break;
        default:
          showErrorSnackBar(Icons.cloud_off_rounded, lang.errorsConnectionFailed, lang.errorsConnectionFailedSubtitle);
      }
    }
    loggingIn.value = false;
  }
}
