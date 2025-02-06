import 'package:canteenlib/canteenlib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String username,
    required Uzivatel data,
    required Map<int, String> canteenLocations,
    required String canteenUrl,
  }) = _User;
}
