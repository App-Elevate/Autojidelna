import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage keys for FlutterSecureStorage and options for iOS
class SecureStorage {
  static String get loginData => 'loginData';
  static String get appleAuthKey => 'apple_auth_key';
  static get options => const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
}
