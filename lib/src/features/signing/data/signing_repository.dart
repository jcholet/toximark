import 'dart:typed_data';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennaxia_geolocation/src/features/producer/models/models.dart';
import 'package:tennaxia_geolocation/src/features/user/user.dart';

part 'signing_repository.g.dart';

typedef PickUpId = int;

class SigningRepository {
  SigningRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<void> producerSigning(
    UserId userId,
    Uint8List signature,
    PickUpId pickUpId,
    double latitude,
    double longitude,
  ) async {
    try {
      final bucketName = 'signatures/$pickUpId';

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/signature.png');
      await tempFile.writeAsBytes(signature);

      await _supabaseClient.storage.from(bucketName).upload(
            '$userId.png',
            tempFile,
          );

      final publicUrl =
          _supabaseClient.storage.from(bucketName).getPublicUrl('$userId.png');

      await _supabaseClient.from('waste_pick').update(
        {
          'producer_signature': publicUrl,
          'producer_signature_location': 'POINT($longitude $latitude)',
          'producer_signed_at': DateTime.now().toUtc().toIso8601String(),
        },
      ).eq('id', pickUpId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> transporterPickUpSigning(
    String transporterId,
    Uint8List signature,
    PickUpId pickUpId,
    double latitude,
    double longitude,
  ) async {
    try {
      final bucketName = 'signatures/$pickUpId';

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/signature.png');
      await tempFile.writeAsBytes(signature);

      await _supabaseClient.storage.from(bucketName).upload(
            '$transporterId.png',
            tempFile,
          );

      final publicUrl = _supabaseClient.storage
          .from(bucketName)
          .getPublicUrl('$transporterId.png');

      await _supabaseClient.from('waste_pick').update(
        {
          'transporter_pickup_signature': publicUrl,
          'transporter_pickup_signature_location':
              'POINT($longitude $latitude)',
          'transporter_pickup_signed_at':
              DateTime.now().toUtc().toIso8601String(),
        },
      ).eq('id', pickUpId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

@Riverpod(keepAlive: true)
SigningRepository signingRepository(Ref ref) {
  return SigningRepository(
    supabaseClient: Supabase.instance.client,
  );
}
