import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/errors.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool loggingIn = false;
  String? urlError;
  bool usernameError = false;
  String? passwordError;
  bool hidePassword = true;

  LoginProvider() {
    setLastUrl();
  }

  void changePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void setLastUrl() {
    urlController.text = Hive.box(Boxes.appState).get(HiveKeys.url, defaultValue: '');
  }

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    FocusManager.instance.primaryFocus?.unfocus();
    _setErrors(null, null, null);
    loggingIn = true;
    notifyListeners();

    final account = Account(
      username: usernameController.text,
      password: passwordController.text,
      url: urlController.text,
    );

    try {
      await context.read<UserProvider>().login(account);
      Hive.box(Boxes.appState).put(HiveKeys.url, urlController.text);
      if (context.mounted) await context.read<CanteenProvider>().preIndexMenus();
      if (context.mounted) context.router.replaceAll([const RouterPage()], updateExistingRoutes: false);
    } catch (e) {
      if (context.mounted) handleAuthError(context, e);
    }
    loggingIn = false;
    notifyListeners();
  }

  void handleAuthError(BuildContext context, dynamic e) async {
    final lang = context.l10n;
    switch (e) {
      case AuthErrors.noInternetConnection:
        bool retry = await showInternetConnectionSnackBar();
        if (retry && context.mounted) login(context);
        break;
      case AuthErrors.wrongCredentials:
        _setErrors(lang.errorsWrongCredentialsTextField, true, null);
        break;
      case AuthErrors.wrongUrl:
        _setErrors(null, null, lang.errorsWrongUrl);
        break;
      default:
        showErrorSnackBar(SnackBarAuthErrors.connectionFailed(lang));
    }
  }

  void _setErrors(String? passwordErr, bool? usernameErr, String? urlErr) {
    passwordError = passwordErr;
    usernameError = usernameErr ?? false;
    urlError = urlErr;
    notifyListeners();
  }
}
