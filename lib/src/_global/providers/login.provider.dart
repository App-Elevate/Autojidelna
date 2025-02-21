import 'package:autojidelna/src/_conf/errors.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  final GlobalKey<FormState> urlForm = GlobalKey<FormState>();
  final GlobalKey<FormState> credentialsForm = GlobalKey<FormState>();

  bool _loggingIn = false;
  String? urlError;
  bool usernameError = false;
  String? passwordError;
  bool hidePassword = true;
  SafeAccount? _pickedAccount;

  final Map<String, String> urls = {
    'Střední průmyslová škola a Gymnázium Třebešín': 'jidelna.trebesin.cz',
    'Základní škola Ostrava': 'obedy.zs-mat5.cz',
    'Česká zemědělská akademie v Humpolci': 'jidelna.cza-hu.cz',
  };

  LoginProvider() {
    setLastUrl();
  }

  bool get loggingIn => _loggingIn;
  SafeAccount? get pickedAccount => _pickedAccount;

  set loggingIn(bool value) {
    if (_loggingIn == value) return;
    _loggingIn = value;
    notifyListeners();
  }

  void setPickedAccount(SafeAccount account) {
    if (_pickedAccount == account) return;
    _pickedAccount = account;
    notifyListeners();
  }

  void changePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void setLastUrl() {
    urlController.text = Hive.box(Boxes.appState).get(HiveKeys.url, defaultValue: '');
  }

  Future<bool> login(BuildContext context) async {
    if (!credentialsForm.currentState!.validate()) return false;

    FocusManager.instance.primaryFocus?.unfocus();
    setErrors(null, null, null);
    bool value = false;
    _loggingIn = true;
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
      value = true;
    } catch (e) {
      if (context.mounted) handleAuthError(context, e);
    }
    _loggingIn = false;
    notifyListeners();
    return value;
  }

  void handleAuthError(BuildContext context, dynamic e) async {
    final lang = context.l10n;
    switch (e) {
      case AuthErrors.noInternetConnection:
        bool retry = await showInternetConnectionSnackBar();
        if (retry && context.mounted) login(context);
        break;
      case AuthErrors.wrongCredentials:
        setErrors(lang.errorsWrongCredentialsTextField, true, null);
        break;
      case AuthErrors.wrongUrl:
        setErrors(null, null, lang.errorsWrongUrl);
        break;
      default:
        showErrorSnackBar(SnackBarAuthErrors.connectionFailed(lang));
    }
  }

  void setErrors(String? passwordErr, bool? usernameErr, String? urlErr) {
    passwordError = passwordErr;
    usernameError = usernameErr ?? false;
    urlError = urlErr;
    notifyListeners();
  }
}
