import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            ElevatedButton(
              onPressed: () async => Fluttertoast.showToast(
                msg: App.localization.currentLocale?.languageCode ?? '',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              ),
              child: const Text('Print locale'),
            ),
            ElevatedButton(onPressed: () => App.localization.translate('en'), child: const Text('English')),
            ElevatedButton(onPressed: () => App.localization.translate('cs'), child: const Text('Czech')),
          ],
        ),
      ),
    );
  }
}
