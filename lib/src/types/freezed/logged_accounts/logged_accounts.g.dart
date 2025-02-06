// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedAccountsImpl _$$LoggedAccountsImplFromJson(Map<String, dynamic> json) =>
    _$LoggedAccountsImpl(
      loggedInUsername: json['logged_in_username'] as String?,
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LoggedAccountsImplToJson(
        _$LoggedAccountsImpl instance) =>
    <String, dynamic>{
      'logged_in_username': instance.loggedInUsername,
      'accounts': instance.accounts,
    };
