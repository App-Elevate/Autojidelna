import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingParamPage()),
              child: Text(lang.routingGoToParamDetailPage),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const LocalizationsPage()),
              child: Text(lang.language),
            ),
          ],
        ),
      ),
    );
  }
}
