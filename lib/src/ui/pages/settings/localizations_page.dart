import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/package_info.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class LocalizationsPage extends StatelessWidget {
  const LocalizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.localization.getString(context)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Alocale.localization.getString(context)),
            ElevatedButton(onPressed: () => print(Localizations.localeOf(context).languageCode), child: const Text('Print locale')),
            ElevatedButton(onPressed: () => App.localization.translate('en'), child: const Text('English')),
            ElevatedButton(onPressed: () => App.localization.translate('cs'), child: const Text('Czech')),
          ],
        ),
      ),
    );
  }
}
