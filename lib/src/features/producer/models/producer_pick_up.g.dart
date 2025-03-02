// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producer_pick_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProducerPickUpImpl _$$ProducerPickUpImplFromJson(Map<String, dynamic> json) =>
    _$ProducerPickUpImpl(
      id: (json['id'] as num).toInt(),
      transporterName: json['transporter_name'] as String?,
      transporterId: json['transporter_id'] as String?,
      treatmentCenterId: json['treatment_center_id'] as String,
      treatmentCenterName: json['treatment_center_name'] as String?,
      wasteCode: (json['waste_code'] as num).toInt(),
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      packagingType: json['packaging_type'] as String,
      pickUpDate: DateTime.parse(json['pickup_date'] as String),
      dropOffDate: DateTime.parse(json['dropoff_date'] as String),
      status: json['status'] as String,
      producerSignature: json['producer_signature'] as String?,
      producerSignedAt: json['producer_signed_at'] == null
          ? null
          : DateTime.parse(json['producer_signed_at'] as String),
      treatmentCenterSignature: json['treatment_center_signature'] as String?,
      treatmentCenterSignedAt: json['treatment_center_signed_at'] == null
          ? null
          : DateTime.parse(json['treatment_center_signed_at'] as String),
      transporterPickupSignature:
          json['transporter_pickup_signature'] as String?,
      transporterDropoffSignature:
          json['transporter_dropoff_signature'] as String?,
      transporterPickupSignedAt: json['transporter_pickup_signed_at'] == null
          ? null
          : DateTime.parse(json['transporter_pickup_signed_at'] as String),
      transporterDropoffSignedAt: json['transporter_dropoff_signed_at'] == null
          ? null
          : DateTime.parse(json['transporter_dropoff_signed_at'] as String),
      dropOffLatitude: (json['dropoff_latitude'] as num?)?.toDouble(),
      dropOffLongitude: (json['dropoff_longitude'] as num?)?.toDouble(),
      pickUpLatitude: (json['pickup_latitude'] as num?)?.toDouble(),
      pickUpLongitude: (json['pickup_longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProducerPickUpImplToJson(
        _$ProducerPickUpImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transporterName': instance.transporterName,
      'treatmentCenterId': instance.treatmentCenterId,
      'wasteCode': instance.wasteCode,
      'description': instance.description,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'packagingType': instance.packagingType,
      'pickUpDate': instance.pickUpDate.toIso8601String(),
      'dropOffDate': instance.dropOffDate.toIso8601String(),
      'status': instance.status,
      'producerSignature': instance.producerSignature,
      'producerSignedAt': instance.producerSignedAt?.toIso8601String(),
      'treatmentCenterSignature': instance.treatmentCenterSignature,
      'treatmentCenterSignedAt':
          instance.treatmentCenterSignedAt?.toIso8601String(),
      'transporterPickupSignature': instance.transporterPickupSignature,
      'transporterDropoffSignature': instance.transporterDropoffSignature,
      'transporterPickupSignedAt':
          instance.transporterPickupSignedAt?.toIso8601String(),
      'transporterDropoffSignedAt':
          instance.transporterDropoffSignedAt?.toIso8601String(),
      'dropOffLatitude': instance.dropOffLatitude,
      'dropOffLongitude': instance.dropOffLongitude,
      'pickUpLatitude': instance.pickUpLatitude,
      'pickUpLongitude': instance.pickUpLongitude,
    };
