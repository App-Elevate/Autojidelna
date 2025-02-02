// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_accounts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoggedAccounts _$LoggedAccountsFromJson(Map<String, dynamic> json) {
  return _LoggedAccounts.fromJson(json);
}

/// @nodoc
mixin _$LoggedAccounts {
  @JsonKey(name: 'currently_logged_in_id')
  int? get currentlyLoggedInId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currently_logged_in_id')
  set currentlyLoggedInId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  List<Account> get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  set users(List<Account> value) => throw _privateConstructorUsedError;

  /// Serializes this LoggedAccounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoggedAccountsCopyWith<LoggedAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedAccountsCopyWith<$Res> {
  factory $LoggedAccountsCopyWith(
          LoggedAccounts value, $Res Function(LoggedAccounts) then) =
      _$LoggedAccountsCopyWithImpl<$Res, LoggedAccounts>;
  @useResult
  $Res call(
      {@JsonKey(name: 'currently_logged_in_id') int? currentlyLoggedInId,
      @JsonKey(name: 'users') List<Account> users});
}

/// @nodoc
class _$LoggedAccountsCopyWithImpl<$Res, $Val extends LoggedAccounts>
    implements $LoggedAccountsCopyWith<$Res> {
  _$LoggedAccountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentlyLoggedInId = freezed,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      currentlyLoggedInId: freezed == currentlyLoggedInId
          ? _value.currentlyLoggedInId
          : currentlyLoggedInId // ignore: cast_nullable_to_non_nullable
              as int?,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoggedAccountsImplCopyWith<$Res>
    implements $LoggedAccountsCopyWith<$Res> {
  factory _$$LoggedAccountsImplCopyWith(_$LoggedAccountsImpl value,
          $Res Function(_$LoggedAccountsImpl) then) =
      __$$LoggedAccountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'currently_logged_in_id') int? currentlyLoggedInId,
      @JsonKey(name: 'users') List<Account> users});
}

/// @nodoc
class __$$LoggedAccountsImplCopyWithImpl<$Res>
    extends _$LoggedAccountsCopyWithImpl<$Res, _$LoggedAccountsImpl>
    implements _$$LoggedAccountsImplCopyWith<$Res> {
  __$$LoggedAccountsImplCopyWithImpl(
      _$LoggedAccountsImpl _value, $Res Function(_$LoggedAccountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentlyLoggedInId = freezed,
    Object? users = null,
  }) {
    return _then(_$LoggedAccountsImpl(
      currentlyLoggedInId: freezed == currentlyLoggedInId
          ? _value.currentlyLoggedInId
          : currentlyLoggedInId // ignore: cast_nullable_to_non_nullable
              as int?,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedAccountsImpl
    with DiagnosticableTreeMixin
    implements _LoggedAccounts {
  const _$LoggedAccountsImpl(
      {@JsonKey(name: 'currently_logged_in_id') this.currentlyLoggedInId,
      @JsonKey(name: 'users') this.users = const []});

  factory _$LoggedAccountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedAccountsImplFromJson(json);

  @override
  @JsonKey(name: 'currently_logged_in_id')
  int? currentlyLoggedInId;
  @override
  @JsonKey(name: 'users')
  List<Account> users;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoggedAccounts(currentlyLoggedInId: $currentlyLoggedInId, users: $users)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoggedAccounts'))
      ..add(DiagnosticsProperty('currentlyLoggedInId', currentlyLoggedInId))
      ..add(DiagnosticsProperty('users', users));
  }

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedAccountsImplCopyWith<_$LoggedAccountsImpl> get copyWith =>
      __$$LoggedAccountsImplCopyWithImpl<_$LoggedAccountsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedAccountsImplToJson(
      this,
    );
  }
}

abstract class _LoggedAccounts implements LoggedAccounts {
  const factory _LoggedAccounts(
      {@JsonKey(name: 'currently_logged_in_id') int? currentlyLoggedInId,
      @JsonKey(name: 'users') List<Account> users}) = _$LoggedAccountsImpl;

  factory _LoggedAccounts.fromJson(Map<String, dynamic> json) =
      _$LoggedAccountsImpl.fromJson;

  @override
  @JsonKey(name: 'currently_logged_in_id')
  int? get currentlyLoggedInId;
  @JsonKey(name: 'currently_logged_in_id')
  set currentlyLoggedInId(int? value);
  @override
  @JsonKey(name: 'users')
  List<Account> get users;
  @JsonKey(name: 'users')
  set users(List<Account> value);

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoggedAccountsImplCopyWith<_$LoggedAccountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
