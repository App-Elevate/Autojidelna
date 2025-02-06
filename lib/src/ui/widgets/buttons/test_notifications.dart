import 'package:autojidelna/src/logic/notifications.dart';
import 'package:flutter/material.dart';

class NotificationActionButton extends StatelessWidget {
  const NotificationActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(onTap: () async => doNotifications(force: true), title: const Text('Notifications Force')),
        ListTile(onTap: () async => doNotifications(), title: const Text('Notifications')),
      ],
    );
  }
}
