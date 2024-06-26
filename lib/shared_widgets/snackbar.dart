// Snackbar widgets

import 'package:autojidelna/local_imports.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

SnackBar snackbarFunction(String snackBarText) {
  return SnackBar(
    //light or dark theme
    content: Text(snackBarText),
  );
}

/// SnackBar shown when the user has accepted the download
/// of a new release and the download is in progress
/// [valueListenable] is the value notifier that contains the download progress
/// -1 means that the download hasn't started yet and is waiting for permission
/// -2 means that the download failed
/// 1 means that the download is complete and the installation is in progress
/// 0-1 means that the download is in progress
SnackBar updateSnackbar(BuildContext context, ValueListenable valueListenable) {
  return SnackBar(
    //light or dark theme
    duration: const Duration(days: 1),
    content: ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (ctx, value, child) {
        switch (value) {
          case -1:
            return Text(Texts.updateSnackbarWaiting.i18n());
          case -2:
            closeSnackbarAfterDelay(context);
            return failedUpdate(context);
          case 1:
            closeSnackbarAfterDelay(context);
            return updateFinished(context);
          default:
            return Text(Texts.updateSnackbarDownloading.i18n([(value * 100).toInt().toString()]));
        }
      },
    ),
  );
}

Future<void> closeSnackbarAfterDelay(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 4));
  if (context.mounted) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}

Row failedUpdate(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //light or dark theme
          child: Text(Texts.updateSnackbarError.i18n()),
        ),
      ),
      Flexible(
        child: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: Text(Texts.updateSnackbarTryAgain.i18n()),
          );
        }),
      ),
      Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Icon(Icons.close),
          );
        },
      ),
    ],
  );
}

Row updateFinished(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //light or dark theme
          child: Text(Texts.updateSnackbarDownloaded.i18n()),
        ),
      ),
      Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Icon(Icons.close),
          );
        },
      ),
    ],
  );
}
