import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/errors.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
import 'package:autojidelna/src/types/app_context.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    BuildContext? ctx = App.getIt<AppContext>().context;
    if (ctx == null && !ctx!.mounted) return;
    final Texts lang = ctx.l10n;

    if (ctx.read<UserProvider>().user != null) return resolver.next(true); // if logged in during onboarding

    try {
      await ctx.read<UserProvider>().loadUser();
      try {
        if (ctx.mounted) await ctx.read<CanteenProvider>().preIndexMenus();
      } catch (_) {} // Just QoL
      resolver.next(true); // Allow navigation
    } catch (e) {
      switch (e) {
        case AuthErrors.accountNotFound:
          // TODO: Show list of other logged-in accounts
          break;
        case AuthErrors.connectionFailed:
          showErrorSnackBar(SnackBarAuthErrors.connectionFailed(lang));
          break;
        case AuthErrors.noInternetConnection:
          bool retry = await showInternetConnectionSnackBar();
          if (retry) {
            onNavigation(resolver, router); // Retry login
            return;
          }
          break;
        case AuthErrors.wrongCredentials:
          showErrorSnackBar(SnackBarAuthErrors.wrongCredentials(lang));
          break;
        case AuthErrors.wrongUrl:
          showErrorSnackBar(SnackBarAuthErrors.wrongUrl(lang));
          break;
        default:
      }

      resolver.redirect(const LoginPage(), replace: true);
    }
  }
}
