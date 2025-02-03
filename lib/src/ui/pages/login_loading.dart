import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginLoading extends StatefulWidget {
  const LoginLoading({super.key});

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading> {
  void login() async {
    BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext!;
    final Texts lang = ctx.l10n;
    try {
      await context.read<UserProvider>().loadUser();
    } catch (e) {
      switch (e) {
        case AuthErrors.accountNotFound:
          showErrorSnackBar(Icons.person_off_outlined, lang.errorsAccountNotFound, lang.errorsAccountNotFoundSubtitle);
          break;
        case AuthErrors.connectionFailed:
          showErrorSnackBar(Icons.cloud_off_rounded, lang.errorsConnectionFailed, lang.errorsConnectionFailedSubtitle);
          break;
        case AuthErrors.noInternetConnection:
          bool value = await showInternetConnectionSnackBar();
          if (value) login();
          break;
        case AuthErrors.wrongCredentials:
          showErrorSnackBar(Icons.lock_outline_rounded, lang.errorsWrongCredentials, lang.errorsWrongCredentialsSubtitle);
          break;
        case AuthErrors.wrongUrl:
          showErrorSnackBar(Icons.link_off_rounded, lang.errorsWrongUrl, lang.errorsWrongUrlSubtitle);
          break;
        default:
          if (mounted) context.router.replaceAll([const LoginPage()]);
      }
      return;
    }
    if (mounted) context.router.replaceAll([const RouterPage()]);
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
