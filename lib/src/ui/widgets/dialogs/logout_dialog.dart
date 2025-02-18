import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget logoutDialog(BuildContext context, SafeAccount safeAccount) {
  final Texts lang = context.l10n;

  return AlertDialog(
    title: Text(lang.logoutUSure),
    actionsAlignment: MainAxisAlignment.spaceBetween,
    alignment: Alignment.bottomCenter,
    actions: <Widget>[
      TextButton(
        onPressed: () async {
          await context.read<UserProvider>().logout(safeAccount);
          if (context.mounted) context.router.replaceAll([const LoginLoading()]);
        },
        child: Text(lang.logoutConfirm),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        style: Theme.of(context).textButtonTheme.style!.copyWith(foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary)),
        child: Text(lang.cancel),
      ),
    ],
  );
}
