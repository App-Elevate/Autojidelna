// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snack_bar_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SnackBarData {
  @JsonKey(name: 'icon_data')
  IconData get iconData => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtitle')
  String? get subtitle => throw _privateConstructorUsedError;

  /// Create a copy of SnackBarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SnackBarDataCopyWith<SnackBarData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnackBarDataCopyWith<$Res> {
  factory $SnackBarDataCopyWith(
          SnackBarData value, $Res Function(SnackBarData) then) =
      _$SnackBarDataCopyWithImpl<$Res, SnackBarData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'icon_data') IconData iconData,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'subtitle') String? subtitle});
}

/// @nodoc
class _$SnackBarDataCopyWithImpl<$Res, $Val extends SnackBarData>
    implements $SnackBarDataCopyWith<$Res> {
  _$SnackBarDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SnackBarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconData = null,
    Object? title = null,
    Object? subtitle = freezed,
  }) {
    return _then(_value.copyWith(
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnackBarDataImplCopyWith<$Res>
    implements $SnackBarDataCopyWith<$Res> {
  factory _$$SnackBarDataImplCopyWith(
          _$SnackBarDataImpl value, $Res Function(_$SnackBarDataImpl) then) =
      __$$SnackBarDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'icon_data') IconData iconData,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'subtitle') String? subtitle});
}

/// @nodoc
class __$$SnackBarDataImplCopyWithImpl<$Res>
    extends _$SnackBarDataCopyWithImpl<$Res, _$SnackBarDataImpl>
    implements _$$SnackBarDataImplCopyWith<$Res> {
  __$$SnackBarDataImplCopyWithImpl(
      _$SnackBarDataImpl _value, $Res Function(_$SnackBarDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SnackBarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconData = null,
    Object? title = null,
    Object? subtitle = freezed,
  }) {
    return _then(_$SnackBarDataImpl(
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SnackBarDataImpl implements _SnackBarData {
  const _$SnackBarDataImpl(
      {@JsonKey(name: 'icon_data') required this.iconData,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'subtitle') this.subtitle});

  @override
  @JsonKey(name: 'icon_data')
  final IconData iconData;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'subtitle')
  final String? subtitle;

  @override
  String toString() {
    return 'SnackBarData(iconData: $iconData, title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnackBarDataImpl &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, iconData, title, subtitle);

  /// Create a copy of SnackBarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SnackBarDataImplCopyWith<_$SnackBarDataImpl> get copyWith =>
      __$$SnackBarDataImplCopyWithImpl<_$SnackBarDataImpl>(this, _$identity);
}

abstract class _SnackBarData implements SnackBarData {
  const factory _SnackBarData(
      {@JsonKey(name: 'icon_data') required final IconData iconData,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'subtitle') final String? subtitle}) = _$SnackBarDataImpl;

  @override
  @JsonKey(name: 'icon_data')
  IconData get iconData;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'subtitle')
  String? get subtitle;

  /// Create a copy of SnackBarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SnackBarDataImplCopyWith<_$SnackBarDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
