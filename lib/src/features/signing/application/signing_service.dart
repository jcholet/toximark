import 'dart:async';
import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tennaxia_geolocation/src/features/authentication/authentication.dart';
import 'package:tennaxia_geolocation/src/features/producer/data/producer_repository.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/signing/signing.dart';

part 'signing_service.g.dart';

class SigningService {
  SigningService(this.ref);

  final Ref ref;

  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  SigningRepository get signingRepository =>
      ref.read(signingRepositoryProvider);

  Future<void> producerSigning(
    Uint8List signature,
    PickUpId pickUpId,
    double latitude,
    double longitude,
  ) async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Error();
    }

    await signingRepository.producerSigning(
      user.id,
      signature,
      pickUpId,
      latitude,
      longitude,
    );
  }

  Future<void> transporterPickUpSigning(
    String transporterId,
    Uint8List signature,
    PickUpId pickUpId,
    double latitude,
    double longitude,
  ) async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Error();
    }

    await signingRepository.transporterPickUpSigning(
      transporterId,
      signature,
      pickUpId,
      latitude,
      longitude,
    );
  }
}

@Riverpod(keepAlive: true)
SigningService signingService(Ref ref) {
  return SigningService(ref);
}
