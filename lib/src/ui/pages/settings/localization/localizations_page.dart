import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
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
              onPressed: () => App.translate(const Locale('en')),
              child: Text(lang.languageEnglish),
            ),
            ElevatedButton(
              onPressed: () => App.translate(const Locale('cs')),
              child: Text(lang.languageCzech),
            ),
          ],
        ),
      ),
    );
  }
}
