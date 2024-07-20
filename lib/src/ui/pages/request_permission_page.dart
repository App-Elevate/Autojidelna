import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_messaging/messaging.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RequestPermissionPage extends StatelessWidget {
  const RequestPermissionPage({super.key, this.onResult});

  final void Function(bool)? onResult;

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop && onResult != null) {
          onResult!(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.requestNotificationPermission),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final permission = await FirebaseMessaging.instance.requestPermission(
                    alert: true,
                    announcement: false,
                    badge: true,
                    carPlay: false,
                    criticalAlert: false,
                    provisional: false,
                    sound: true,
                  );
                  if (permission.authorizationStatus == AuthorizationStatus.authorized ||
                      permission.authorizationStatus == AuthorizationStatus.provisional) {
                    Messaging.onNotificationPermissionGranted();
                  }
                  onResult!(true);
                },
                child: Text(lang.requestNotificationPermission),
              ),
              ElevatedButton(onPressed: onResult != null ? () => onResult!(true) : null, child: Text(lang.noThankYou)),
            ],
          ),
        ),
      ),
    );
  }
}
