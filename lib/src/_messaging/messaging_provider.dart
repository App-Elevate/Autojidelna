import 'package:coree/src/_messaging/messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingProvider extends ChangeNotifier {
  MessagingProvider() {
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotificationMessage);
  }
  RemoteMessage? _message;
  RemoteMessage? get message => _message;

  void handleNotificationMessage(RemoteMessage message) {
    _message = message;
    Messaging.currentMessage = message;
    notifyListeners();
  }

  void notificationMessageHandled() {
    _message = null;
  }
}
