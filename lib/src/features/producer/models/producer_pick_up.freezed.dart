// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'producer_pick_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProducerPickUp _$ProducerPickUpFromJson(Map<String, dynamic> json) {
  return _ProducerPickUp.fromJson(json);
}

/// @nodoc
mixin _$ProducerPickUp {
  int get id => throw _privateConstructorUsedError;
  String? get transporterName => throw _privateConstructorUsedError;
  String? get transporterId => throw _privateConstructorUsedError;
  String get treatmentCenterId => throw _privateConstructorUsedError;
  String? get treatmentCenterName => throw _privateConstructorUsedError;
  int get wasteCode => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get packagingType => throw _privateConstructorUsedError;
  DateTime get pickUpDate => throw _privateConstructorUsedError;
  DateTime get dropOffDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get producerSignature => throw _privateConstructorUsedError;
  DateTime? get producerSignedAt => throw _privateConstructorUsedError;
  String? get treatmentCenterSignature => throw _privateConstructorUsedError;
  DateTime? get treatmentCenterSignedAt => throw _privateConstructorUsedError;
  String? get transporterPickupSignature => throw _privateConstructorUsedError;
  String? get transporterDropoffSignature => throw _privateConstructorUsedError;
  DateTime? get transporterPickupSignedAt => throw _privateConstructorUsedError;
  DateTime? get transporterDropoffSignedAt =>
      throw _privateConstructorUsedError;
  double? get dropOffLatitude => throw _privateConstructorUsedError;
  double? get dropOffLongitude => throw _privateConstructorUsedError;
  double? get pickUpLatitude => throw _privateConstructorUsedError;
  double? get pickUpLongitude => throw _privateConstructorUsedError;

  /// Serializes this ProducerPickUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProducerPickUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProducerPickUpCopyWith<ProducerPickUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProducerPickUpCopyWith<$Res> {
  factory $ProducerPickUpCopyWith(
          ProducerPickUp value, $Res Function(ProducerPickUp) then) =
      _$ProducerPickUpCopyWithImpl<$Res, ProducerPickUp>;
  @useResult
  $Res call(
      {int id,
      String? transporterName,
      String? transporterId,
      String treatmentCenterId,
      String? treatmentCenterName,
      int wasteCode,
      String description,
      int quantity,
      String unit,
      String packagingType,
      DateTime pickUpDate,
      DateTime dropOffDate,
      String status,
      String? producerSignature,
      DateTime? producerSignedAt,
      String? treatmentCenterSignature,
      DateTime? treatmentCenterSignedAt,
      String? transporterPickupSignature,
      String? transporterDropoffSignature,
      DateTime? transporterPickupSignedAt,
      DateTime? transporterDropoffSignedAt,
      double? dropOffLatitude,
      double? dropOffLongitude,
      double? pickUpLatitude,
      double? pickUpLongitude});
}

/// @nodoc
class _$ProducerPickUpCopyWithImpl<$Res, $Val extends ProducerPickUp>
    implements $ProducerPickUpCopyWith<$Res> {
  _$ProducerPickUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProducerPickUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transporterName = freezed,
    Object? transporterId = freezed,
    Object? treatmentCenterId = null,
    Object? treatmentCenterName = freezed,
    Object? wasteCode = null,
    Object? description = null,
    Object? quantity = null,
    Object? unit = null,
    Object? packagingType = null,
    Object? pickUpDate = null,
    Object? dropOffDate = null,
    Object? status = null,
    Object? producerSignature = freezed,
    Object? producerSignedAt = freezed,
    Object? treatmentCenterSignature = freezed,
    Object? treatmentCenterSignedAt = freezed,
    Object? transporterPickupSignature = freezed,
    Object? transporterDropoffSignature = freezed,
    Object? transporterPickupSignedAt = freezed,
    Object? transporterDropoffSignedAt = freezed,
    Object? dropOffLatitude = freezed,
    Object? dropOffLongitude = freezed,
    Object? pickUpLatitude = freezed,
    Object? pickUpLongitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      transporterName: freezed == transporterName
          ? _value.transporterName
          : transporterName // ignore: cast_nullable_to_non_nullable
              as String?,
      transporterId: freezed == transporterId
          ? _value.transporterId
          : transporterId // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentCenterId: null == treatmentCenterId
          ? _value.treatmentCenterId
          : treatmentCenterId // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentCenterName: freezed == treatmentCenterName
          ? _value.treatmentCenterName
          : treatmentCenterName // ignore: cast_nullable_to_non_nullable
              as String?,
      wasteCode: null == wasteCode
          ? _value.wasteCode
          : wasteCode // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      packagingType: null == packagingType
          ? _value.packagingType
          : packagingType // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpDate: null == pickUpDate
          ? _value.pickUpDate
          : pickUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dropOffDate: null == dropOffDate
          ? _value.dropOffDate
          : dropOffDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      producerSignature: freezed == producerSignature
          ? _value.producerSignature
          : producerSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      producerSignedAt: freezed == producerSignedAt
          ? _value.producerSignedAt
          : producerSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      treatmentCenterSignature: freezed == treatmentCenterSignature
          ? _value.treatmentCenterSignature
          : treatmentCenterSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentCenterSignedAt: freezed == treatmentCenterSignedAt
          ? _value.treatmentCenterSignedAt
          : treatmentCenterSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transporterPickupSignature: freezed == transporterPickupSignature
          ? _value.transporterPickupSignature
          : transporterPickupSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      transporterDropoffSignature: freezed == transporterDropoffSignature
          ? _value.transporterDropoffSignature
          : transporterDropoffSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      transporterPickupSignedAt: freezed == transporterPickupSignedAt
          ? _value.transporterPickupSignedAt
          : transporterPickupSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transporterDropoffSignedAt: freezed == transporterDropoffSignedAt
          ? _value.transporterDropoffSignedAt
          : transporterDropoffSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dropOffLatitude: freezed == dropOffLatitude
          ? _value.dropOffLatitude
          : dropOffLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropOffLongitude: freezed == dropOffLongitude
          ? _value.dropOffLongitude
          : dropOffLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickUpLatitude: freezed == pickUpLatitude
          ? _value.pickUpLatitude
          : pickUpLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickUpLongitude: freezed == pickUpLongitude
          ? _value.pickUpLongitude
          : pickUpLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProducerPickUpImplCopyWith<$Res>
    implements $ProducerPickUpCopyWith<$Res> {
  factory _$$ProducerPickUpImplCopyWith(_$ProducerPickUpImpl value,
          $Res Function(_$ProducerPickUpImpl) then) =
      __$$ProducerPickUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? transporterName,
      String? transporterId,
      String treatmentCenterId,
      String? treatmentCenterName,
      int wasteCode,
      String description,
      int quantity,
      String unit,
      String packagingType,
      DateTime pickUpDate,
      DateTime dropOffDate,
      String status,
      String? producerSignature,
      DateTime? producerSignedAt,
      String? treatmentCenterSignature,
      DateTime? treatmentCenterSignedAt,
      String? transporterPickupSignature,
      String? transporterDropoffSignature,
      DateTime? transporterPickupSignedAt,
      DateTime? transporterDropoffSignedAt,
      double? dropOffLatitude,
      double? dropOffLongitude,
      double? pickUpLatitude,
      double? pickUpLongitude});
}

/// @nodoc
class __$$ProducerPickUpImplCopyWithImpl<$Res>
    extends _$ProducerPickUpCopyWithImpl<$Res, _$ProducerPickUpImpl>
    implements _$$ProducerPickUpImplCopyWith<$Res> {
  __$$ProducerPickUpImplCopyWithImpl(
      _$ProducerPickUpImpl _value, $Res Function(_$ProducerPickUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProducerPickUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transporterName = freezed,
    Object? transporterId = freezed,
    Object? treatmentCenterId = null,
    Object? treatmentCenterName = freezed,
    Object? wasteCode = null,
    Object? description = null,
    Object? quantity = null,
    Object? unit = null,
    Object? packagingType = null,
    Object? pickUpDate = null,
    Object? dropOffDate = null,
    Object? status = null,
    Object? producerSignature = freezed,
    Object? producerSignedAt = freezed,
    Object? treatmentCenterSignature = freezed,
    Object? treatmentCenterSignedAt = freezed,
    Object? transporterPickupSignature = freezed,
    Object? transporterDropoffSignature = freezed,
    Object? transporterPickupSignedAt = freezed,
    Object? transporterDropoffSignedAt = freezed,
    Object? dropOffLatitude = freezed,
    Object? dropOffLongitude = freezed,
    Object? pickUpLatitude = freezed,
    Object? pickUpLongitude = freezed,
  }) {
    return _then(_$ProducerPickUpImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      transporterName: freezed == transporterName
          ? _value.transporterName
          : transporterName // ignore: cast_nullable_to_non_nullable
              as String?,
      transporterId: freezed == transporterId
          ? _value.transporterId
          : transporterId // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentCenterId: null == treatmentCenterId
          ? _value.treatmentCenterId
          : treatmentCenterId // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentCenterName: freezed == treatmentCenterName
          ? _value.treatmentCenterName
          : treatmentCenterName // ignore: cast_nullable_to_non_nullable
              as String?,
      wasteCode: null == wasteCode
          ? _value.wasteCode
          : wasteCode // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      packagingType: null == packagingType
          ? _value.packagingType
          : packagingType // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpDate: null == pickUpDate
          ? _value.pickUpDate
          : pickUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dropOffDate: null == dropOffDate
          ? _value.dropOffDate
          : dropOffDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      producerSignature: freezed == producerSignature
          ? _value.producerSignature
          : producerSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      producerSignedAt: freezed == producerSignedAt
          ? _value.producerSignedAt
          : producerSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      treatmentCenterSignature: freezed == treatmentCenterSignature
          ? _value.treatmentCenterSignature
          : treatmentCenterSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentCenterSignedAt: freezed == treatmentCenterSignedAt
          ? _value.treatmentCenterSignedAt
          : treatmentCenterSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transporterPickupSignature: freezed == transporterPickupSignature
          ? _value.transporterPickupSignature
          : transporterPickupSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      transporterDropoffSignature: freezed == transporterDropoffSignature
          ? _value.transporterDropoffSignature
          : transporterDropoffSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      transporterPickupSignedAt: freezed == transporterPickupSignedAt
          ? _value.transporterPickupSignedAt
          : transporterPickupSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transporterDropoffSignedAt: freezed == transporterDropoffSignedAt
          ? _value.transporterDropoffSignedAt
          : transporterDropoffSignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dropOffLatitude: freezed == dropOffLatitude
          ? _value.dropOffLatitude
          : dropOffLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropOffLongitude: freezed == dropOffLongitude
          ? _value.dropOffLongitude
          : dropOffLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickUpLatitude: freezed == pickUpLatitude
          ? _value.pickUpLatitude
          : pickUpLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickUpLongitude: freezed == pickUpLongitude
          ? _value.pickUpLongitude
          : pickUpLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProducerPickUpImpl extends _ProducerPickUp {
  const _$ProducerPickUpImpl(
      {required this.id,
      required this.transporterName,
      required this.transporterId,
      required this.treatmentCenterId,
      required this.treatmentCenterName,
      required this.wasteCode,
      required this.description,
      required this.quantity,
      required this.unit,
      required this.packagingType,
      required this.pickUpDate,
      required this.dropOffDate,
      required this.status,
      required this.producerSignature,
      required this.producerSignedAt,
      required this.treatmentCenterSignature,
      required this.treatmentCenterSignedAt,
      required this.transporterPickupSignature,
      required this.transporterDropoffSignature,
      required this.transporterPickupSignedAt,
      required this.transporterDropoffSignedAt,
      required this.dropOffLatitude,
      required this.dropOffLongitude,
      required this.pickUpLatitude,
      required this.pickUpLongitude})
      : super._();

  factory _$ProducerPickUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProducerPickUpImplFromJson(json);

  @override
  final int id;
  @override
  final String? transporterName;
  @override
  final String? transporterId;
  @override
  final String treatmentCenterId;
  @override
  final String? treatmentCenterName;
  @override
  final int wasteCode;
  @override
  final String description;
  @override
  final int quantity;
  @override
  final String unit;
  @override
  final String packagingType;
  @override
  final DateTime pickUpDate;
  @override
  final DateTime dropOffDate;
  @override
  final String status;
  @override
  final String? producerSignature;
  @override
  final DateTime? producerSignedAt;
  @override
  final String? treatmentCenterSignature;
  @override
  final DateTime? treatmentCenterSignedAt;
  @override
  final String? transporterPickupSignature;
  @override
  final String? transporterDropoffSignature;
  @override
  final DateTime? transporterPickupSignedAt;
  @override
  final DateTime? transporterDropoffSignedAt;
  @override
  final double? dropOffLatitude;
  @override
  final double? dropOffLongitude;
  @override
  final double? pickUpLatitude;
  @override
  final double? pickUpLongitude;

  @override
  String toString() {
    return 'ProducerPickUp(id: $id, transporterName: $transporterName, transporterId: $transporterId, treatmentCenterId: $treatmentCenterId, treatmentCenterName: $treatmentCenterName, wasteCode: $wasteCode, description: $description, quantity: $quantity, unit: $unit, packagingType: $packagingType, pickUpDate: $pickUpDate, dropOffDate: $dropOffDate, status: $status, producerSignature: $producerSignature, producerSignedAt: $producerSignedAt, treatmentCenterSignature: $treatmentCenterSignature, treatmentCenterSignedAt: $treatmentCenterSignedAt, transporterPickupSignature: $transporterPickupSignature, transporterDropoffSignature: $transporterDropoffSignature, transporterPickupSignedAt: $transporterPickupSignedAt, transporterDropoffSignedAt: $transporterDropoffSignedAt, dropOffLatitude: $dropOffLatitude, dropOffLongitude: $dropOffLongitude, pickUpLatitude: $pickUpLatitude, pickUpLongitude: $pickUpLongitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProducerPickUpImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transporterName, transporterName) ||
                other.transporterName == transporterName) &&
            (identical(other.transporterId, transporterId) ||
                other.transporterId == transporterId) &&
            (identical(other.treatmentCenterId, treatmentCenterId) ||
                other.treatmentCenterId == treatmentCenterId) &&
            (identical(other.treatmentCenterName, treatmentCenterName) ||
                other.treatmentCenterName == treatmentCenterName) &&
            (identical(other.wasteCode, wasteCode) ||
                other.wasteCode == wasteCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.packagingType, packagingType) ||
                other.packagingType == packagingType) &&
            (identical(other.pickUpDate, pickUpDate) ||
                other.pickUpDate == pickUpDate) &&
            (identical(other.dropOffDate, dropOffDate) ||
                other.dropOffDate == dropOffDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.producerSignature, producerSignature) ||
                other.producerSignature == producerSignature) &&
            (identical(other.producerSignedAt, producerSignedAt) ||
                other.producerSignedAt == producerSignedAt) &&
            (identical(
                    other.treatmentCenterSignature, treatmentCenterSignature) ||
                other.treatmentCenterSignature == treatmentCenterSignature) &&
            (identical(other.treatmentCenterSignedAt, treatmentCenterSignedAt) ||
                other.treatmentCenterSignedAt == treatmentCenterSignedAt) &&
            (identical(other.transporterPickupSignature, transporterPickupSignature) ||
                other.transporterPickupSignature ==
                    transporterPickupSignature) &&
            (identical(other.transporterDropoffSignature,
                    transporterDropoffSignature) ||
                other.transporterDropoffSignature ==
                    transporterDropoffSignature) &&
            (identical(other.transporterPickupSignedAt, transporterPickupSignedAt) ||
                other.transporterPickupSignedAt == transporterPickupSignedAt) &&
            (identical(other.transporterDropoffSignedAt, transporterDropoffSignedAt) ||
                other.transporterDropoffSignedAt ==
                    transporterDropoffSignedAt) &&
            (identical(other.dropOffLatitude, dropOffLatitude) ||
                other.dropOffLatitude == dropOffLatitude) &&
            (identical(other.dropOffLongitude, dropOffLongitude) ||
                other.dropOffLongitude == dropOffLongitude) &&
            (identical(other.pickUpLatitude, pickUpLatitude) ||
                other.pickUpLatitude == pickUpLatitude) &&
            (identical(other.pickUpLongitude, pickUpLongitude) ||
                other.pickUpLongitude == pickUpLongitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        transporterName,
        transporterId,
        treatmentCenterId,
        treatmentCenterName,
        wasteCode,
        description,
        quantity,
        unit,
        packagingType,
        pickUpDate,
        dropOffDate,
        status,
        producerSignature,
        producerSignedAt,
        treatmentCenterSignature,
        treatmentCenterSignedAt,
        transporterPickupSignature,
        transporterDropoffSignature,
        transporterPickupSignedAt,
        transporterDropoffSignedAt,
        dropOffLatitude,
        dropOffLongitude,
        pickUpLatitude,
        pickUpLongitude
      ]);

  /// Create a copy of ProducerPickUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProducerPickUpImplCopyWith<_$ProducerPickUpImpl> get copyWith =>
      __$$ProducerPickUpImplCopyWithImpl<_$ProducerPickUpImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProducerPickUpImplToJson(
      this,
    );
  }
}

abstract class _ProducerPickUp extends ProducerPickUp {
  const factory _ProducerPickUp(
      {required final int id,
      required final String? transporterName,
      required final String? transporterId,
      required final String treatmentCenterId,
      required final String? treatmentCenterName,
      required final int wasteCode,
      required final String description,
      required final int quantity,
      required final String unit,
      required final String packagingType,
      required final DateTime pickUpDate,
      required final DateTime dropOffDate,
      required final String status,
      required final String? producerSignature,
      required final DateTime? producerSignedAt,
      required final String? treatmentCenterSignature,
      required final DateTime? treatmentCenterSignedAt,
      required final String? transporterPickupSignature,
      required final String? transporterDropoffSignature,
      required final DateTime? transporterPickupSignedAt,
      required final DateTime? transporterDropoffSignedAt,
      required final double? dropOffLatitude,
      required final double? dropOffLongitude,
      required final double? pickUpLatitude,
      required final double? pickUpLongitude}) = _$ProducerPickUpImpl;
  const _ProducerPickUp._() : super._();

  factory _ProducerPickUp.fromJson(Map<String, dynamic> json) =
      _$ProducerPickUpImpl.fromJson;

  @override
  int get id;
  @override
  String? get transporterName;
  @override
  String? get transporterId;
  @override
  String get treatmentCenterId;
  @override
  String? get treatmentCenterName;
  @override
  int get wasteCode;
  @override
  String get description;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  String get packagingType;
  @override
  DateTime get pickUpDate;
  @override
  DateTime get dropOffDate;
  @override
  String get status;
  @override
  String? get producerSignature;
  @override
  DateTime? get producerSignedAt;
  @override
  String? get treatmentCenterSignature;
  @override
  DateTime? get treatmentCenterSignedAt;
  @override
  String? get transporterPickupSignature;
  @override
  String? get transporterDropoffSignature;
  @override
  DateTime? get transporterPickupSignedAt;
  @override
  DateTime? get transporterDropoffSignedAt;
  @override
  double? get dropOffLatitude;
  @override
  double? get dropOffLongitude;
  @override
  double? get pickUpLatitude;
  @override
  double? get pickUpLongitude;

  /// Create a copy of ProducerPickUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProducerPickUpImplCopyWith<_$ProducerPickUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
