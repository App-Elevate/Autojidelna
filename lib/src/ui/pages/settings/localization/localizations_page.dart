import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/lang/supported_locales.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LocalizationsPage extends StatelessWidget {
  const LocalizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.localization),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => App.translate(Locales.en),
              child: Text(lang.languageEnglish),
            ),
            ElevatedButton(
              onPressed: () => App.translate(Locales.cs),
              child: Text(lang.languageCzech),
            ),
          ],
        ),
      ),
    );
  }
}
