import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'safe_account.freezed.dart';

@freezed
class SafeAccount with _$SafeAccount {
  const factory SafeAccount({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'url') required String url,
  }) = _SafeAccount;
}
