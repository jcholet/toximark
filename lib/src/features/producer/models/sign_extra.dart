import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';

part 'sign_extra.freezed.dart';

@freezed
class SignExtra with _$SignExtra {
  const factory SignExtra({
    required ProducerPickUp producerPickUp,
    required Uint8List signatureBytes,
    required double latitude,
    required double longitude,
  }) = _SignExtra;

  const SignExtra._();
}
