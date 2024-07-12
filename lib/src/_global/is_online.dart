import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Is Online change notifier which can be used to check if the device is online.
class IsOnline extends ChangeNotifier {
  bool isOnline = false;
  bool isOnlineLocal = false;
  late final StreamSubscription<InternetStatus> listenerInternet;
  late final StreamSubscription<List<ConnectivityResult>> listenerNetwork;

  IsOnline() {
    listenerInternet = InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          isOnline = true;
          notifyListeners();
          // The internet is now connected
          break;
        case InternetStatus.disconnected:
          isOnline = false;
          notifyListeners();
          // The internet is now disconnected
          break;
      }
    });
    listenerNetwork = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.vpn) && connectivityResult.length == 1) {
        isOnlineLocal = false;
      }
      isOnlineLocal = !connectivityResult.contains(ConnectivityResult.none);
    });
  }

  @override
  void dispose() {
    unawaited(listenerInternet.cancel());
    unawaited(listenerNetwork.cancel());
    super.dispose();
  }
}
