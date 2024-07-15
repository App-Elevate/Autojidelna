import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.secretPage.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async => context.router.navigate(const SettingsPage()),
              child: Text(Alocale.goToSettings.getString(context)),
            ),
          ],
        ),
      ),
    );
  }
}
