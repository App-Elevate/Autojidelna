import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.secretPage),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async => context.router.navigate(const SettingsPage()),
              child: Text(l10n.goToSettings),
            ),
          ],
        ),
      ),
    );
  }
}
