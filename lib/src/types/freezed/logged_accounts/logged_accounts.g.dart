// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedAccountsImpl _$$LoggedAccountsImplFromJson(Map<String, dynamic> json) =>
    _$LoggedAccountsImpl(
      loggedInAccount: json['logged_in_account'] == null
          ? null
          : SafeAccount.fromJson(
              json['logged_in_account'] as Map<String, dynamic>),
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LoggedAccountsImplToJson(
        _$LoggedAccountsImpl instance) =>
    <String, dynamic>{
      'logged_in_account': instance.loggedInAccount,
      'accounts': instance.accounts,
    };
