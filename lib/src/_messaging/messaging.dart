import 'dart:async';
import 'dart:io';

import 'package:coree/src/_conf/messaging.dart';
import 'package:coree/src/_messaging/exponential_backoff.dart';
import 'package:coree/src/_routing/app_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class Messaging {
  // ignore: cancel_subscriptions
  static StreamSubscription<String>? onTokenRefresh;
  //.  /\
  //   |
  // As for firebase docs there is no need to cancel this subscription.
  // It dies along with the app being closed.

  static RemoteMessage? currentMessage;
  static String? fcmToken;
  static String? apnsToken;
  static bool grantedPermission = false;

  static Future<void> onNotificationPermissionGranted() async {
    grantedPermission = true;
    if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
      final apnsTokenLocal =
          await retryWithExponentialBackoff(() async => await FirebaseMessaging.instance.getAPNSToken(), ignoreError: true, infinite: true);
      if (apnsTokenLocal == null) {
        return;
      }
      apnsToken = apnsTokenLocal;
    }
    final fcmToken = await FirebaseMessaging.instance
        .getToken(vapidKey: kIsWeb ? 'BCA2GZa5SucDxk3knHVJ_ip_PDiVcqNnbTgnw2aT1kmdt9QtG2SvH7E91DrvfssjuNZhHqAbYCM4yRmI3BmnSes' : null);
    if (fcmToken != null) {
      await onSuccessfulToken(fcmToken);
    }
  }

  static Future<void> onSuccessfulToken(String token) async {
    onTokenRefresh ??= FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      onSuccessfulToken(fcmToken);
    });
    onTokenRefresh!.onError((_) => null);
    retryWithExponentialBackoff(
      () async => await FirebaseMessaging.instance.subscribeToTopic(MessagingConf.allTopic),
      ignoreError: true,
      infinite: true,
    );
    fcmToken = token;

    // Save the token to the server
    // Here will be the code to save the token to the server (for instance a REST API call to a go server or a )
  }

  static Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    final message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      messagingProvider.handleMessage(message);
    }
  }
}
