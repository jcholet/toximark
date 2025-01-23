import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tennaxia_geolocation/src/features/location/location.dart';

part 'producer_signing_controller.g.dart';

@riverpod
class ProducerSigningController extends _$ProducerSigningController {
  @override
  FutureOr<Position?> build() {
    return determinePosition();
  }

  Future<Position?> determinePosition() async {
    final locationRepository = ref.read(locationRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(locationRepository.determinePositionOrNull);

    return state.valueOrNull;
  }
}
