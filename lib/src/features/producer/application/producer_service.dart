import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tennaxia_geolocation/src/features/authentication/authentication.dart';
import 'package:tennaxia_geolocation/src/features/producer/data/producer_repository.dart';
import 'package:tennaxia_geolocation/src/features/producer/producer.dart';
import 'package:tennaxia_geolocation/src/features/signing/signing.dart';

part 'producer_service.g.dart';

class ProducerService {
  ProducerService(this.ref);

  final Ref ref;

  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  ProducerRepository get producerRepository =>
      ref.read(producerRepositoryProvider);

  Future<List<ProducerPickUp>> fetchProducerPickUp() async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Error();
    }

    return producerRepository.fetchProducerPickUp(user.id);
  }

  Future<void> updatePickUpStatus(PickUpId pickUpId) async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Error();
    }
    return producerRepository.updatePickUpStatus(pickUpId);
  }
}

@Riverpod(keepAlive: true)
ProducerService producerService(Ref ref) {
  return ProducerService(ref);
}

@Riverpod(keepAlive: true)
FutureOr<List<ProducerPickUp>> producerPickUpFuture(Ref ref) {
  final producerService = ref.read(producerServiceProvider);
  return producerService.fetchProducerPickUp();
}
