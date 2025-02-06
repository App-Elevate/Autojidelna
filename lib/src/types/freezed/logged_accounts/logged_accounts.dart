// This file is "main.dart"
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'logged_accounts.freezed.dart';
part 'logged_accounts.g.dart';

@unfreezed
class LoggedAccounts with _$LoggedAccounts {
  factory LoggedAccounts({
    @JsonKey(name: 'logged_in_username') String? loggedInUsername,
    @JsonKey(name: 'accounts') @Default([]) List<Account> accounts,
  }) = _LoggedAccounts;

  factory LoggedAccounts.fromJson(Map<String, Object?> json) => _$LoggedAccountsFromJson(json);
}
