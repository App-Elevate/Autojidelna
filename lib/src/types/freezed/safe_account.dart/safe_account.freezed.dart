// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'safe_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SafeAccount {
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  /// Create a copy of SafeAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SafeAccountCopyWith<SafeAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafeAccountCopyWith<$Res> {
  factory $SafeAccountCopyWith(
          SafeAccount value, $Res Function(SafeAccount) then) =
      _$SafeAccountCopyWithImpl<$Res, SafeAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String username,
      @JsonKey(name: 'url') String url});
}

/// @nodoc
class _$SafeAccountCopyWithImpl<$Res, $Val extends SafeAccount>
    implements $SafeAccountCopyWith<$Res> {
  _$SafeAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SafeAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafeAccountImplCopyWith<$Res>
    implements $SafeAccountCopyWith<$Res> {
  factory _$$SafeAccountImplCopyWith(
          _$SafeAccountImpl value, $Res Function(_$SafeAccountImpl) then) =
      __$$SafeAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String username,
      @JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$SafeAccountImplCopyWithImpl<$Res>
    extends _$SafeAccountCopyWithImpl<$Res, _$SafeAccountImpl>
    implements _$$SafeAccountImplCopyWith<$Res> {
  __$$SafeAccountImplCopyWithImpl(
      _$SafeAccountImpl _value, $Res Function(_$SafeAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SafeAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? url = null,
  }) {
    return _then(_$SafeAccountImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SafeAccountImpl with DiagnosticableTreeMixin implements _SafeAccount {
  const _$SafeAccountImpl(
      {@JsonKey(name: 'username') required this.username,
      @JsonKey(name: 'url') required this.url});

  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SafeAccount(username: $username, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SafeAccount'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafeAccountImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, url);

  /// Create a copy of SafeAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SafeAccountImplCopyWith<_$SafeAccountImpl> get copyWith =>
      __$$SafeAccountImplCopyWithImpl<_$SafeAccountImpl>(this, _$identity);
}

abstract class _SafeAccount implements SafeAccount {
  const factory _SafeAccount(
      {@JsonKey(name: 'username') required final String username,
      @JsonKey(name: 'url') required final String url}) = _$SafeAccountImpl;

  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'url')
  String get url;

  /// Create a copy of SafeAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SafeAccountImplCopyWith<_$SafeAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
