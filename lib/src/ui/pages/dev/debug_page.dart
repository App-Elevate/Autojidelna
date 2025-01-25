import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/crash_logic.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(title: const Text('Debug')),
      body: ListView(
        children: <Widget>[
          TextField(
            onChanged: (value) async => value == 'crash' ? crashTestFunction() : null,
            decoration: InputDecoration(
              labelText: lang.typeCrash,
              border: const OutlineInputBorder(),
            ),
          ),
          ListTile(
            title: const Text('Show error Snack Bar'),
            onTap: () => showErrorSnackBar(Icons.wifi_off_rounded, lang.error, lang.errorsNoInternet),
          ),
          ListTile(
            title: const Text('Show info Snack Bar'),
            onTap: () => showInfoSnackBar(Icons.wifi_off_rounded, lang.appName, lang.appDescription),
          ),
        ],
      ),
    );
  }
}
