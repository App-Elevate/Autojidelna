// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canteen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CanteenData {
  /// id, aby se nám neindexovaly špatně jídelníčky
  int get id => throw _privateConstructorUsedError;

  /// id, aby se nám neindexovaly špatně jídelníčky
  set id(int value) => throw _privateConstructorUsedError;

  /// info o uživateli - např kredit,jméno,příjmení...
  Uzivatel get uzivatel => throw _privateConstructorUsedError;

  /// info o uživateli - např kredit,jméno,příjmení...
  set uzivatel(Uzivatel value) => throw _privateConstructorUsedError;

  /// seznam jídel, které jsou na burze
  List<Burza> get jidlaNaBurze => throw _privateConstructorUsedError;

  /// seznam jídel, které jsou na burze
  set jidlaNaBurze(List<Burza> value) => throw _privateConstructorUsedError;

  /// jídelníčky, které aktuálně načítáme
  Map<DateTime, Completer<Jidelnicek>> get currentlyLoading =>
      throw _privateConstructorUsedError;

  /// jídelníčky, které aktuálně načítáme
  set currentlyLoading(Map<DateTime, Completer<Jidelnicek>> value) =>
      throw _privateConstructorUsedError;

  /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
  Map<DateTime, Jidelnicek> get jidelnicky =>
      throw _privateConstructorUsedError;

  /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
  set jidelnicky(Map<DateTime, Jidelnicek> value) =>
      throw _privateConstructorUsedError;

  /// fix pro api vracející méně jídel než by mělo
  Map<DateTime, int> get pocetJidel => throw _privateConstructorUsedError;

  /// fix pro api vracející méně jídel než by mělo
  set pocetJidel(Map<DateTime, int> value) =>
      throw _privateConstructorUsedError;
  Map<int, String>? get vydejny => throw _privateConstructorUsedError;
  set vydejny(Map<int, String>? value) => throw _privateConstructorUsedError;

  /// Create a copy of CanteenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CanteenDataCopyWith<CanteenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanteenDataCopyWith<$Res> {
  factory $CanteenDataCopyWith(
          CanteenData value, $Res Function(CanteenData) then) =
      _$CanteenDataCopyWithImpl<$Res, CanteenData>;
  @useResult
  $Res call(
      {int id,
      Uzivatel uzivatel,
      List<Burza> jidlaNaBurze,
      Map<DateTime, Completer<Jidelnicek>> currentlyLoading,
      Map<DateTime, Jidelnicek> jidelnicky,
      Map<DateTime, int> pocetJidel,
      Map<int, String>? vydejny});
}

/// @nodoc
class _$CanteenDataCopyWithImpl<$Res, $Val extends CanteenData>
    implements $CanteenDataCopyWith<$Res> {
  _$CanteenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CanteenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uzivatel = null,
    Object? jidlaNaBurze = null,
    Object? currentlyLoading = null,
    Object? jidelnicky = null,
    Object? pocetJidel = null,
    Object? vydejny = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uzivatel: null == uzivatel
          ? _value.uzivatel
          : uzivatel // ignore: cast_nullable_to_non_nullable
              as Uzivatel,
      jidlaNaBurze: null == jidlaNaBurze
          ? _value.jidlaNaBurze
          : jidlaNaBurze // ignore: cast_nullable_to_non_nullable
              as List<Burza>,
      currentlyLoading: null == currentlyLoading
          ? _value.currentlyLoading
          : currentlyLoading // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Completer<Jidelnicek>>,
      jidelnicky: null == jidelnicky
          ? _value.jidelnicky
          : jidelnicky // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Jidelnicek>,
      pocetJidel: null == pocetJidel
          ? _value.pocetJidel
          : pocetJidel // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
      vydejny: freezed == vydejny
          ? _value.vydejny
          : vydejny // ignore: cast_nullable_to_non_nullable
              as Map<int, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CanteenDataImplCopyWith<$Res>
    implements $CanteenDataCopyWith<$Res> {
  factory _$$CanteenDataImplCopyWith(
          _$CanteenDataImpl value, $Res Function(_$CanteenDataImpl) then) =
      __$$CanteenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Uzivatel uzivatel,
      List<Burza> jidlaNaBurze,
      Map<DateTime, Completer<Jidelnicek>> currentlyLoading,
      Map<DateTime, Jidelnicek> jidelnicky,
      Map<DateTime, int> pocetJidel,
      Map<int, String>? vydejny});
}

/// @nodoc
class __$$CanteenDataImplCopyWithImpl<$Res>
    extends _$CanteenDataCopyWithImpl<$Res, _$CanteenDataImpl>
    implements _$$CanteenDataImplCopyWith<$Res> {
  __$$CanteenDataImplCopyWithImpl(
      _$CanteenDataImpl _value, $Res Function(_$CanteenDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CanteenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uzivatel = null,
    Object? jidlaNaBurze = null,
    Object? currentlyLoading = null,
    Object? jidelnicky = null,
    Object? pocetJidel = null,
    Object? vydejny = freezed,
  }) {
    return _then(_$CanteenDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uzivatel: null == uzivatel
          ? _value.uzivatel
          : uzivatel // ignore: cast_nullable_to_non_nullable
              as Uzivatel,
      jidlaNaBurze: null == jidlaNaBurze
          ? _value.jidlaNaBurze
          : jidlaNaBurze // ignore: cast_nullable_to_non_nullable
              as List<Burza>,
      currentlyLoading: null == currentlyLoading
          ? _value.currentlyLoading
          : currentlyLoading // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Completer<Jidelnicek>>,
      jidelnicky: null == jidelnicky
          ? _value.jidelnicky
          : jidelnicky // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Jidelnicek>,
      pocetJidel: null == pocetJidel
          ? _value.pocetJidel
          : pocetJidel // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
      vydejny: freezed == vydejny
          ? _value.vydejny
          : vydejny // ignore: cast_nullable_to_non_nullable
              as Map<int, String>?,
    ));
  }
}

/// @nodoc

class _$CanteenDataImpl with DiagnosticableTreeMixin implements _CanteenData {
  _$CanteenDataImpl(
      {this.id = 0,
      required this.uzivatel,
      required this.jidlaNaBurze,
      required this.currentlyLoading,
      required this.jidelnicky,
      required this.pocetJidel,
      this.vydejny});

  /// id, aby se nám neindexovaly špatně jídelníčky
  @override
  @JsonKey()
  int id;

  /// info o uživateli - např kredit,jméno,příjmení...
  @override
  Uzivatel uzivatel;

  /// seznam jídel, které jsou na burze
  @override
  List<Burza> jidlaNaBurze;

  /// jídelníčky, které aktuálně načítáme
  @override
  Map<DateTime, Completer<Jidelnicek>> currentlyLoading;

  /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
  @override
  Map<DateTime, Jidelnicek> jidelnicky;

  /// fix pro api vracející méně jídel než by mělo
  @override
  Map<DateTime, int> pocetJidel;
  @override
  Map<int, String>? vydejny;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CanteenData(id: $id, uzivatel: $uzivatel, jidlaNaBurze: $jidlaNaBurze, currentlyLoading: $currentlyLoading, jidelnicky: $jidelnicky, pocetJidel: $pocetJidel, vydejny: $vydejny)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CanteenData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uzivatel', uzivatel))
      ..add(DiagnosticsProperty('jidlaNaBurze', jidlaNaBurze))
      ..add(DiagnosticsProperty('currentlyLoading', currentlyLoading))
      ..add(DiagnosticsProperty('jidelnicky', jidelnicky))
      ..add(DiagnosticsProperty('pocetJidel', pocetJidel))
      ..add(DiagnosticsProperty('vydejny', vydejny));
  }

  /// Create a copy of CanteenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CanteenDataImplCopyWith<_$CanteenDataImpl> get copyWith =>
      __$$CanteenDataImplCopyWithImpl<_$CanteenDataImpl>(this, _$identity);
}

abstract class _CanteenData implements CanteenData {
  factory _CanteenData(
      {int id,
      required Uzivatel uzivatel,
      required List<Burza> jidlaNaBurze,
      required Map<DateTime, Completer<Jidelnicek>> currentlyLoading,
      required Map<DateTime, Jidelnicek> jidelnicky,
      required Map<DateTime, int> pocetJidel,
      Map<int, String>? vydejny}) = _$CanteenDataImpl;

  /// id, aby se nám neindexovaly špatně jídelníčky
  @override
  int get id;

  /// id, aby se nám neindexovaly špatně jídelníčky
  set id(int value);

  /// info o uživateli - např kredit,jméno,příjmení...
  @override
  Uzivatel get uzivatel;

  /// info o uživateli - např kredit,jméno,příjmení...
  set uzivatel(Uzivatel value);

  /// seznam jídel, které jsou na burze
  @override
  List<Burza> get jidlaNaBurze;

  /// seznam jídel, které jsou na burze
  set jidlaNaBurze(List<Burza> value);

  /// jídelníčky, které aktuálně načítáme
  @override
  Map<DateTime, Completer<Jidelnicek>> get currentlyLoading;

  /// jídelníčky, které aktuálně načítáme
  set currentlyLoading(Map<DateTime, Completer<Jidelnicek>> value);

  /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
  @override
  Map<DateTime, Jidelnicek> get jidelnicky;

  /// seznam předindexovaných jídelníčků začínající Od Pondělí tohoto týdne
  set jidelnicky(Map<DateTime, Jidelnicek> value);

  /// fix pro api vracející méně jídel než by mělo
  @override
  Map<DateTime, int> get pocetJidel;

  /// fix pro api vracející méně jídel než by mělo
  set pocetJidel(Map<DateTime, int> value);
  @override
  Map<int, String>? get vydejny;
  set vydejny(Map<int, String>? value);

  /// Create a copy of CanteenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CanteenDataImplCopyWith<_$CanteenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
