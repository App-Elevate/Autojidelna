import 'package:flutter/material.dart';

SnackBar baseSnackBar(BuildContext context, {Color? backgroundColor, Color? foregroundColor, IconData? icon, String title = '', String? subtitle}) {
  final ListTileThemeData tileTheme = Theme.of(context).listTileTheme;

  return SnackBar(
    backgroundColor: backgroundColor,
    padding: EdgeInsets.zero,
    content: ListTile(
      autofocus: true,
      iconColor: foregroundColor,
      minVerticalPadding: 16,
      titleTextStyle: tileTheme.titleTextStyle!.copyWith(color: foregroundColor),
      subtitleTextStyle: tileTheme.subtitleTextStyle!.copyWith(color: foregroundColor),
      leading: Icon(icon, size: 40),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
    ),
  );
}
