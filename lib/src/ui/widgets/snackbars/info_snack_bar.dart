import 'package:autojidelna/src/ui/widgets/snackbars/base_snack_bar.dart';
import 'package:flutter/material.dart';

SnackBar infoSnackBar(BuildContext context, {String title = '', String? subtitle}) {
  return baseSnackBar(
    context,
    foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
    icon: Icons.info_outline_rounded,
    title: title,
    subtitle: subtitle,
  );
}
