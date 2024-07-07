import 'package:connectivity_plus/connectivity_plus.dart';

class IsOnline {
  /// Faster local check, hovewer it does not guarantee that the device is connected to the internet. It only checks if the device is connected to a network.
  static Future<bool> local() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.vpn) && connectivityResult.length == 1) {
      return false;
    }
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}
