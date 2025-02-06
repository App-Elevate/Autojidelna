import 'package:autojidelna/src/ui/widgets/snackbars/base_snack_bar.dart';
import 'package:flutter/material.dart';

SnackBar errorSnackBar(BuildContext context, {IconData? icon, String title = '', String? subtitle}) {
  final ColorScheme colorScheme = Theme.of(context).colorScheme;

  return baseSnackBar(
    context,
    backgroundColor: colorScheme.error,
    foregroundColor: colorScheme.onError,
    icon: icon,
    title: title,
    subtitle: subtitle,
  );
}
