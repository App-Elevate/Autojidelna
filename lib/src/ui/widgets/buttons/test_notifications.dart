import 'package:flutter/material.dart';

class NotificationActionButton extends StatelessWidget {
  const NotificationActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(onTap: null /* TODO: () async => doNotifications(force: true), title: const Text('Notifications Force')*/),
        ListTile(onTap: null /* TODO: () async => doNotifications(), title: const Text('Notifications')*/),
      ],
    );
  }
}
