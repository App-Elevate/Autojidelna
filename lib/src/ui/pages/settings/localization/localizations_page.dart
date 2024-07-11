import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:toastification/toastification.dart';

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
            ElevatedButton(
              onPressed: () async => Toastification().show(
                title: Text(
                  '${Alocale.localization.getString(context)}: ${App.localization.currentLocale}',
                ),
                alignment: Alignment.bottomCenter,
                style: ToastificationStyle.simple,
                autoCloseDuration: const Duration(seconds: 2),
              ),
              child: Text(Alocale.showLocale.getString(context)),
            ),
            ElevatedButton(onPressed: () => App.localization.translate('en'), child: const Text('English')),
            ElevatedButton(onPressed: () => App.localization.translate('cs'), child: const Text('Čeština')),
          ],
        ),
      ),
    );
  }
}
