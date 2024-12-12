import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage keys for FlutterSecureStorage and options for iOS
class SecureStorage {
  static const String loginData = 'loginData';
  static const String appleAuthKey = 'apple_auth_key';
  static const IOSOptions iosOptions = IOSOptions(accessibility: KeychainAccessibility.first_unlock);
}
