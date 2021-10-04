// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppAdaptativeDataTearOff {
  const _$AppAdaptativeDataTearOff();

  _AppAdaptativeData call({required AppAdaptativeSize size}) {
    return _AppAdaptativeData(
      size: size,
    );
  }
}

/// @nodoc
const $AppAdaptativeData = _$AppAdaptativeDataTearOff();

/// @nodoc
mixin _$AppAdaptativeData {
  AppAdaptativeSize get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppAdaptativeDataCopyWith<AppAdaptativeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAdaptativeDataCopyWith<$Res> {
  factory $AppAdaptativeDataCopyWith(
          AppAdaptativeData value, $Res Function(AppAdaptativeData) then) =
      _$AppAdaptativeDataCopyWithImpl<$Res>;
  $Res call({AppAdaptativeSize size});
}

/// @nodoc
class _$AppAdaptativeDataCopyWithImpl<$Res>
    implements $AppAdaptativeDataCopyWith<$Res> {
  _$AppAdaptativeDataCopyWithImpl(this._value, this._then);

  final AppAdaptativeData _value;
  // ignore: unused_field
  final $Res Function(AppAdaptativeData) _then;

  @override
  $Res call({
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as AppAdaptativeSize,
    ));
  }
}

/// @nodoc
abstract class _$AppAdaptativeDataCopyWith<$Res>
    implements $AppAdaptativeDataCopyWith<$Res> {
  factory _$AppAdaptativeDataCopyWith(
          _AppAdaptativeData value, $Res Function(_AppAdaptativeData) then) =
      __$AppAdaptativeDataCopyWithImpl<$Res>;
  @override
  $Res call({AppAdaptativeSize size});
}

/// @nodoc
class __$AppAdaptativeDataCopyWithImpl<$Res>
    extends _$AppAdaptativeDataCopyWithImpl<$Res>
    implements _$AppAdaptativeDataCopyWith<$Res> {
  __$AppAdaptativeDataCopyWithImpl(
      _AppAdaptativeData _value, $Res Function(_AppAdaptativeData) _then)
      : super(_value, (v) => _then(v as _AppAdaptativeData));

  @override
  _AppAdaptativeData get _value => super._value as _AppAdaptativeData;

  @override
  $Res call({
    Object? size = freezed,
  }) {
    return _then(_AppAdaptativeData(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as AppAdaptativeSize,
    ));
  }
}

/// @nodoc

class _$_AppAdaptativeData implements _AppAdaptativeData {
  const _$_AppAdaptativeData({required this.size});

  @override
  final AppAdaptativeSize size;

  @override
  String toString() {
    return 'AppAdaptativeData(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppAdaptativeData &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(size);

  @JsonKey(ignore: true)
  @override
  _$AppAdaptativeDataCopyWith<_AppAdaptativeData> get copyWith =>
      __$AppAdaptativeDataCopyWithImpl<_AppAdaptativeData>(this, _$identity);
}

abstract class _AppAdaptativeData implements AppAdaptativeData {
  const factory _AppAdaptativeData({required AppAdaptativeSize size}) =
      _$_AppAdaptativeData;

  @override
  AppAdaptativeSize get size => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppAdaptativeDataCopyWith<_AppAdaptativeData> get copyWith =>
      throw _privateConstructorUsedError;
}
