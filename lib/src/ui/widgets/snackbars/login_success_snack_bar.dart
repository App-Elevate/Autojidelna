import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/info_snack_bar.dart';
import 'package:flutter/material.dart';

SnackBar loginSuccessSnackBar(BuildContext context, String username) {
  return infoSnackBar(
    context,
    icon: Icons.check_circle_outline,
    title: context.l10n.login,
    subtitle: username,
  );
}
