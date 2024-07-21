import 'package:coree/src/_messaging/messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingProvider extends ChangeNotifier {
  MessagingProvider() {
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
  RemoteMessage? _message;
  RemoteMessage? get message => _message;

  void handleMessage(RemoteMessage message) {
    _message = message;
    Messaging.currentMessage = message;
    notifyListeners();
  }

  void messageHandled() {
    _message = null;
  }
}
