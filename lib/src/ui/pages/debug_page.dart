import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_messaging/messaging.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/crash_logic.dart';
import 'package:autojidelna/src/ui/widgets/token_field_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    debugPrint('fcmToken: ${Messaging.fcmToken}');
    debugPrint('apnsToken: ${Messaging.apnsToken}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SelectableText('fcmToken: ${Messaging.fcmToken}'),
            SelectableText('apnsToken: ${Messaging.apnsToken}'),
            TextField(
              onChanged: (value) async => value == 'crash' ? crashTestFunction() : null,
              decoration: InputDecoration(
                labelText: lang.typeCrash,
                border: const OutlineInputBorder(),
              ),
            ),
            Text(App.gotAppCheckToken ? 'Got App Check Token' : 'No App Check Token'),
            const TokenFieldWidget(),
          ],
        ),
      ),
    );
  }
}
