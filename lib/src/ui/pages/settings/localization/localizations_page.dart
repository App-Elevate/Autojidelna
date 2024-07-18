import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/translate.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class LocalizationsPage extends StatelessWidget {
  const LocalizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.localization),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async => Toastification().show(
                title: Text(
                  '${l10n.localization}: ${Localizations.localeOf(context)}',
                ),
                alignment: Alignment.bottomCenter,
                style: ToastificationStyle.simple,
                autoCloseDuration: const Duration(seconds: 2),
              ),
              child: Text(l10n.showLocale),
            ),
            ElevatedButton(
              onPressed: () => context.read<Translate>().translate('en'),
              child: Text(l10n.languageEnglish),
            ),
            ElevatedButton(
              onPressed: () => context.read<Translate>().translate('cs'),
              child: Text(l10n.languageCzech),
            ),
          ],
        ),
      ),
    );
  }
}
