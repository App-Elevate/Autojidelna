import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_messaging/messaging.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
