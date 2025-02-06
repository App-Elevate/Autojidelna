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
  @JsonKey(name: 'logged_in_account')
  SafeAccount? get loggedInAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'logged_in_account')
  set loggedInAccount(SafeAccount? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'accounts')
  List<Account> get accounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'accounts')
  set accounts(List<Account> value) => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'logged_in_account') SafeAccount? loggedInAccount,
      @JsonKey(name: 'accounts') List<Account> accounts});

  $SafeAccountCopyWith<$Res>? get loggedInAccount;
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
    Object? loggedInAccount = freezed,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      loggedInAccount: freezed == loggedInAccount
          ? _value.loggedInAccount
          : loggedInAccount // ignore: cast_nullable_to_non_nullable
              as SafeAccount?,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ) as $Val);
  }

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SafeAccountCopyWith<$Res>? get loggedInAccount {
    if (_value.loggedInAccount == null) {
      return null;
    }

    return $SafeAccountCopyWith<$Res>(_value.loggedInAccount!, (value) {
      return _then(_value.copyWith(loggedInAccount: value) as $Val);
    });
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
      {@JsonKey(name: 'logged_in_account') SafeAccount? loggedInAccount,
      @JsonKey(name: 'accounts') List<Account> accounts});

  @override
  $SafeAccountCopyWith<$Res>? get loggedInAccount;
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
    Object? loggedInAccount = freezed,
    Object? accounts = null,
  }) {
    return _then(_$LoggedAccountsImpl(
      loggedInAccount: freezed == loggedInAccount
          ? _value.loggedInAccount
          : loggedInAccount // ignore: cast_nullable_to_non_nullable
              as SafeAccount?,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedAccountsImpl
    with DiagnosticableTreeMixin
    implements _LoggedAccounts {
  _$LoggedAccountsImpl(
      {@JsonKey(name: 'logged_in_account') this.loggedInAccount,
      @JsonKey(name: 'accounts') this.accounts = const []});

  factory _$LoggedAccountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedAccountsImplFromJson(json);

  @override
  @JsonKey(name: 'logged_in_account')
  SafeAccount? loggedInAccount;
  @override
  @JsonKey(name: 'accounts')
  List<Account> accounts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoggedAccounts(loggedInAccount: $loggedInAccount, accounts: $accounts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoggedAccounts'))
      ..add(DiagnosticsProperty('loggedInAccount', loggedInAccount))
      ..add(DiagnosticsProperty('accounts', accounts));
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
  factory _LoggedAccounts(
          {@JsonKey(name: 'logged_in_account') SafeAccount? loggedInAccount,
          @JsonKey(name: 'accounts') List<Account> accounts}) =
      _$LoggedAccountsImpl;

  factory _LoggedAccounts.fromJson(Map<String, dynamic> json) =
      _$LoggedAccountsImpl.fromJson;

  @override
  @JsonKey(name: 'logged_in_account')
  SafeAccount? get loggedInAccount;
  @JsonKey(name: 'logged_in_account')
  set loggedInAccount(SafeAccount? value);
  @override
  @JsonKey(name: 'accounts')
  List<Account> get accounts;
  @JsonKey(name: 'accounts')
  set accounts(List<Account> value);

  /// Create a copy of LoggedAccounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoggedAccountsImplCopyWith<_$LoggedAccountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
