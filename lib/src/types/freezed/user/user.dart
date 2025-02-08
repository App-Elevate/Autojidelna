import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required SafeAccount accountData,
    required Uzivatel data,
    required Map<int, String> canteenLocations,
  }) = _User;
}
