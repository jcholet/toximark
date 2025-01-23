import 'package:freezed_annotation/freezed_annotation.dart';

part 'producer_pick_up.freezed.dart';
part 'producer_pick_up.g.dart';

@freezed
class ProducerPickUp with _$ProducerPickUp {
  const factory ProducerPickUp({
    required int id,
    required String? transporterName,
    required String? transporterId,
    required String treatmentCenterId,
    required String? treatmentCenterName,
    required int wasteCode,
    required String description,
    required int quantity,
    required String unit,
    required String packagingType,
    required DateTime pickUpDate,
    required DateTime dropOffDate,
    required String status,
    required String? producerSignature,
    required DateTime? producerSignedAt,
    required String? treatmentCenterSignature,
    required DateTime? treatmentCenterSignedAt,
    required String? transporterPickupSignature,
    required String? transporterDropoffSignature,
    required DateTime? transporterPickupSignedAt,
    required DateTime? transporterDropoffSignedAt,
    required double? dropOffLatitude,
    required double? dropOffLongitude,
    required double? pickUpLatitude,
    required double? pickUpLongitude,
  }) = _ProducerPickUp;

  const ProducerPickUp._();

  factory ProducerPickUp.fromJson(Map<String, dynamic> json) =>
      _$ProducerPickUpFromJson(json);
}
