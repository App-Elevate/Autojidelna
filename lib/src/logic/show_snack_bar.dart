import 'dart:async';

import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/error_snack_bar.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/info_snack_bar.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/login_success_snack_bar.dart';
import 'package:flutter/material.dart';

void _showSnackBar(SnackBar snackbar) {
  BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext;
  if (ctx == null) return;

  unawaited(ScaffoldMessenger.of(ctx).showSnackBar(snackbar).closed.then((SnackBarClosedReason reason) {}));
}

void showErrorSnackBar(IconData icon, String title, String? subtitle) {
  BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext;
  if (ctx == null) return;

  _showSnackBar(errorSnackBar(ctx, icon: icon, title: title, subtitle: subtitle));
}

void showInfoSnackBar(IconData icon, String title, String? subtitle) {
  BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext;
  if (ctx == null) return;

  _showSnackBar(infoSnackBar(ctx, icon: icon, title: title, subtitle: subtitle));
}

void showLoginSuccessSnackBar(String username) {
  BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext;
  if (ctx == null) return;

  _showSnackBar(loginSuccessSnackBar(ctx, username));
}
