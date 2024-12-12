import 'package:autojidelna/src/logic/notifications.dart';
import 'package:flutter/material.dart';

class NotificationActionButton extends StatelessWidget {
  const NotificationActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () async => doNotifications(force: true), child: const Text('Notifications Force')),
        ElevatedButton(onPressed: () async => doNotifications(), child: const Text('Notifications')),
      ],
    );
  }
}
