// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignExtra {
  ProducerPickUp get producerPickUp => throw _privateConstructorUsedError;
  Uint8List get signatureBytes => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Create a copy of SignExtra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignExtraCopyWith<SignExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignExtraCopyWith<$Res> {
  factory $SignExtraCopyWith(SignExtra value, $Res Function(SignExtra) then) =
      _$SignExtraCopyWithImpl<$Res, SignExtra>;
  @useResult
  $Res call(
      {ProducerPickUp producerPickUp,
      Uint8List signatureBytes,
      double latitude,
      double longitude});

  $ProducerPickUpCopyWith<$Res> get producerPickUp;
}

/// @nodoc
class _$SignExtraCopyWithImpl<$Res, $Val extends SignExtra>
    implements $SignExtraCopyWith<$Res> {
  _$SignExtraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignExtra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? producerPickUp = null,
    Object? signatureBytes = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      producerPickUp: null == producerPickUp
          ? _value.producerPickUp
          : producerPickUp // ignore: cast_nullable_to_non_nullable
              as ProducerPickUp,
      signatureBytes: null == signatureBytes
          ? _value.signatureBytes
          : signatureBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of SignExtra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProducerPickUpCopyWith<$Res> get producerPickUp {
    return $ProducerPickUpCopyWith<$Res>(_value.producerPickUp, (value) {
      return _then(_value.copyWith(producerPickUp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignExtraImplCopyWith<$Res>
    implements $SignExtraCopyWith<$Res> {
  factory _$$SignExtraImplCopyWith(
          _$SignExtraImpl value, $Res Function(_$SignExtraImpl) then) =
      __$$SignExtraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProducerPickUp producerPickUp,
      Uint8List signatureBytes,
      double latitude,
      double longitude});

  @override
  $ProducerPickUpCopyWith<$Res> get producerPickUp;
}

/// @nodoc
class __$$SignExtraImplCopyWithImpl<$Res>
    extends _$SignExtraCopyWithImpl<$Res, _$SignExtraImpl>
    implements _$$SignExtraImplCopyWith<$Res> {
  __$$SignExtraImplCopyWithImpl(
      _$SignExtraImpl _value, $Res Function(_$SignExtraImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignExtra
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? producerPickUp = null,
    Object? signatureBytes = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$SignExtraImpl(
      producerPickUp: null == producerPickUp
          ? _value.producerPickUp
          : producerPickUp // ignore: cast_nullable_to_non_nullable
              as ProducerPickUp,
      signatureBytes: null == signatureBytes
          ? _value.signatureBytes
          : signatureBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SignExtraImpl extends _SignExtra {
  const _$SignExtraImpl(
      {required this.producerPickUp,
      required this.signatureBytes,
      required this.latitude,
      required this.longitude})
      : super._();

  @override
  final ProducerPickUp producerPickUp;
  @override
  final Uint8List signatureBytes;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'SignExtra(producerPickUp: $producerPickUp, signatureBytes: $signatureBytes, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignExtraImpl &&
            (identical(other.producerPickUp, producerPickUp) ||
                other.producerPickUp == producerPickUp) &&
            const DeepCollectionEquality()
                .equals(other.signatureBytes, signatureBytes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, producerPickUp,
      const DeepCollectionEquality().hash(signatureBytes), latitude, longitude);

  /// Create a copy of SignExtra
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignExtraImplCopyWith<_$SignExtraImpl> get copyWith =>
      __$$SignExtraImplCopyWithImpl<_$SignExtraImpl>(this, _$identity);
}

abstract class _SignExtra extends SignExtra {
  const factory _SignExtra(
      {required final ProducerPickUp producerPickUp,
      required final Uint8List signatureBytes,
      required final double latitude,
      required final double longitude}) = _$SignExtraImpl;
  const _SignExtra._() : super._();

  @override
  ProducerPickUp get producerPickUp;
  @override
  Uint8List get signatureBytes;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of SignExtra
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignExtraImplCopyWith<_$SignExtraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
