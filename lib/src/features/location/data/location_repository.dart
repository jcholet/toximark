import 'package:geolocator/geolocator.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_repository.g.dart';

/// {@template location_exception}
/// Base class for all location-related exceptions.
/// {@endtemplate}
sealed class LocationException extends AppException {
  /// {@macro location_exception}
  LocationException(super.code, super.message);
}

/// {@template location_services_disabled_exception}
/// Thrown when location services are disabled.
/// {@endtemplate}
class LocationServicesDisabledException extends LocationException {
  /// {@macro location_services_disabled_exception}
  LocationServicesDisabledException()
      : super(
          'location-services-disabled',
          'Location services are disabled'.hardcoded,
        );
}

/// {@template location_permissions_denied_exception}
/// Thrown when location permissions are denied.
/// {@endtemplate}
class LocationPermissionsDeniedException extends LocationException {
  /// {@macro location_permissions_denied_exception}
  LocationPermissionsDeniedException()
      : super(
          'location-permissions-denied',
          'Location permissions are denied'.hardcoded,
        );
}

/// {@template location_permissions_denied_forever_exception}
/// Thrown when location permissions are permanently denied.
/// {@endtemplate}
class LocationPermissionsDeniedForeverException extends LocationException {
  /// {@macro location_permissions_denied_forever_exception}
  LocationPermissionsDeniedForeverException()
      : super(
          'location-permissions-denied-forever',
          'Location permissions are permanently denied'.hardcoded,
        );
}

/// {@template location_repository}
/// Repository which manages location operations.
/// {@endtemplate}
class LocationRepository {
  /// {@macro location_repository}
  LocationRepository();

  Future<Position> determinePosition() async {
    LocationPermission permission;

    // Test if location services are enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue accessing the position
      // and request the user to enable the location services
      throw LocationServicesDisabledException();
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionsDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      throw LocationPermissionsDeniedForeverException();
    }

    // When we reach here, permissions are granted and we can continue accessing
    // the position of the device
    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future<Position?> determinePositionOrNull() async {
    try {
      return await determinePosition();
    } catch (_) {
      return null;
    }
  }

  /// Opens the app settings on the device.
  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
}

@Riverpod(keepAlive: true)
LocationRepository locationRepository(Ref ref) {
  return LocationRepository();
}
