import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennaxia_geolocation/src/features/producer/models/models.dart';
import 'package:tennaxia_geolocation/src/features/signing/signing.dart';
import 'package:tennaxia_geolocation/src/features/user/user.dart';

part 'producer_repository.g.dart';

class ProducerRepository {
  ProducerRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<List<ProducerPickUp>> fetchProducerPickUp(
    UserId userId,
  ) async {
    try {
      final data = await _supabaseClient.rpc<List<Map<String, dynamic>>>(
        'get_waste_pick',
        params: {
          'user_id': userId,
        },
      );

      return data.map(ProducerPickUp.fromJson).toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> updatePickUpStatus(
    PickUpId pickUpId,
  ) async {
    try {
      await _supabaseClient.rpc<void>(
        'update_status_if_conditions_met',
        params: {
          'pick_id': pickUpId,
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

@Riverpod(keepAlive: true)
ProducerRepository producerRepository(Ref ref) {
  return ProducerRepository(
    supabaseClient: Supabase.instance.client,
  );
}
