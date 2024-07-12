import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage keys for FlutterSecureStorage and options for iOS
mixin SecureStorage {
  static const String appleAuthKey = 'apple_auth_key';
  static const options = IOSOptions(accessibility: KeychainAccessibility.first_unlock);
}
