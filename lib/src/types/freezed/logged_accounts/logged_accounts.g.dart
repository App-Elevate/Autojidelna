// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedAccountsImpl _$$LoggedAccountsImplFromJson(Map<String, dynamic> json) =>
    _$LoggedAccountsImpl(
      currentlyLoggedInId: (json['currently_logged_in_id'] as num?)?.toInt(),
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LoggedAccountsImplToJson(
        _$LoggedAccountsImpl instance) =>
    <String, dynamic>{
      'currently_logged_in_id': instance.currentlyLoggedInId,
      'users': instance.users,
    };
