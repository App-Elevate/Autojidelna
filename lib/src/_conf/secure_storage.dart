import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin FlutterSecureStorageKeys {
  static const String appleAuthKey = 'apple_auth_key';
  static const options = IOSOptions(accessibility: KeychainAccessibility.first_unlock);
}
