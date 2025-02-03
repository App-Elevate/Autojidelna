import 'dart:async';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Timer? _internetCheckTimer;

Future<bool> showInternetConnectionSnackBar() async {
  BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext;
  if (ctx == null) return false;

  final Completer<bool> completer = Completer<bool>();
  ValueNotifier<bool> notifier = ValueNotifier(false);
  final scaffoldMessenger = ScaffoldMessenger.of(ctx);

  scaffoldMessenger.showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.none,
      padding: EdgeInsets.zero,
      duration: const Duration(days: 1),
      content: ValueListenableBuilder<bool>(
        valueListenable: notifier,
        builder: (context, isOnline, _) {
          ColorScheme colorScheme = Theme.of(context).colorScheme;
          ListTileThemeData tileTheme = Theme.of(context).listTileTheme;
          Color backgroundColor = isOnline ? colorScheme.primary : colorScheme.error;
          Color foregroundColor = isOnline ? colorScheme.onPrimary : colorScheme.onError;
          IconData icon = isOnline ? Icons.wifi_rounded : Icons.wifi_off_rounded;
          String title = isOnline ? context.l10n.errorsGotInternetConnection : context.l10n.errorsNoInternetConnection;
          String subtitle = isOnline ? context.l10n.errorsGotInternetConnectionSubtitle : context.l10n.errorsNoInternetConnectionSubtitle;

          return Container(
            color: backgroundColor,
            child: ListTile(
              autofocus: true,
              iconColor: foregroundColor,
              minVerticalPadding: 16,
              titleTextStyle: tileTheme.titleTextStyle?.copyWith(color: foregroundColor),
              subtitleTextStyle: tileTheme.subtitleTextStyle?.copyWith(color: foregroundColor),
              leading: Icon(icon, size: 40),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          );
        },
      ),
    ),
  );

  // Start checking connection every 3 seconds
  _internetCheckTimer?.cancel();
  _internetCheckTimer = Timer.periodic(
    const Duration(seconds: 1),
    (timer) async {
      bool hasInternet = await InternetConnectionChecker().hasConnection;

      if (hasInternet && !notifier.value) {
        notifier.value = true;

        // Wait 3 seconds before dismissing snackbar
        await Future.delayed(const Duration(seconds: 3));
        scaffoldMessenger.hideCurrentSnackBar();

        _internetCheckTimer?.cancel(); // Stop checking after reconnecting
        completer.complete(true); // Resolve future and return true
      }
    },
  );

  return completer.future; // This will resolve when internet reconnects
}
