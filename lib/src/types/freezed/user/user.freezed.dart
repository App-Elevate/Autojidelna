// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  String get username => throw _privateConstructorUsedError;
  Uzivatel get data => throw _privateConstructorUsedError;
  Map<int, String> get canteenLocations => throw _privateConstructorUsedError;
  String get canteenUrl => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String username,
      Uzivatel data,
      Map<int, String> canteenLocations,
      String canteenUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? data = null,
    Object? canteenLocations = null,
    Object? canteenUrl = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uzivatel,
      canteenLocations: null == canteenLocations
          ? _value.canteenLocations
          : canteenLocations // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      canteenUrl: null == canteenUrl
          ? _value.canteenUrl
          : canteenUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      Uzivatel data,
      Map<int, String> canteenLocations,
      String canteenUrl});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? data = null,
    Object? canteenLocations = null,
    Object? canteenUrl = null,
  }) {
    return _then(_$UserImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uzivatel,
      canteenLocations: null == canteenLocations
          ? _value._canteenLocations
          : canteenLocations // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      canteenUrl: null == canteenUrl
          ? _value.canteenUrl
          : canteenUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl(
      {required this.username,
      required this.data,
      required final Map<int, String> canteenLocations,
      required this.canteenUrl})
      : _canteenLocations = canteenLocations;

  @override
  final String username;
  @override
  final Uzivatel data;
  final Map<int, String> _canteenLocations;
  @override
  Map<int, String> get canteenLocations {
    if (_canteenLocations is EqualUnmodifiableMapView) return _canteenLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_canteenLocations);
  }

  @override
  final String canteenUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(username: $username, data: $data, canteenLocations: $canteenLocations, canteenUrl: $canteenUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('canteenLocations', canteenLocations))
      ..add(DiagnosticsProperty('canteenUrl', canteenUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other._canteenLocations, _canteenLocations) &&
            (identical(other.canteenUrl, canteenUrl) ||
                other.canteenUrl == canteenUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, data,
      const DeepCollectionEquality().hash(_canteenLocations), canteenUrl);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {required final String username,
      required final Uzivatel data,
      required final Map<int, String> canteenLocations,
      required final String canteenUrl}) = _$UserImpl;

  @override
  String get username;
  @override
  Uzivatel get data;
  @override
  Map<int, String> get canteenLocations;
  @override
  String get canteenUrl;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
