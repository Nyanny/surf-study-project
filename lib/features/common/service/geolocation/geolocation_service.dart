import 'package:geolocator/geolocator.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_coordinates.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_problem.dart';
import 'package:surf_study_project/features/common/service/geolocation/igeolocation_service.dart';

/// Class [GeolocationService] is a geolocation service implements
class GeolocationService implements IGeolocationService {
  @override
  Future<GeolocationCoordinates> getCurrentPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return GeolocationCoordinates(
      longitude: currentPosition.longitude,
      latitude: currentPosition.latitude,
    );
  }

  @override
  Future<GeolocationCoordinates> getLastKnownPosition() async {
    final lastKnownPosition = await Geolocator.getLastKnownPosition();
    if (lastKnownPosition != null) {
      return GeolocationCoordinates(
        longitude: lastKnownPosition.longitude,
        latitude: lastKnownPosition.latitude,
      );
    } else {
      return const GeolocationCoordinates(
        longitude: 0,
        latitude: 0,
      );
    }
  }

  @override
  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  /// returns true if there is no problem with permission
  @override
  Future<bool> requestLocationPermission() async {
    return _permissionHandler(await Geolocator.requestPermission());
  }

  /// returns true if there is no problem with permission
  @override
  Future<bool> requestLocationService() async {
    var isLocationServiceEnabled = await verifyLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      await Geolocator.openLocationSettings();
      isLocationServiceEnabled = await verifyLocationServiceEnabled();
    }
    return isLocationServiceEnabled;
  }

  @override
  Future<GeolocationProblem>
      verifyAndRequestLocationServiceAndPermission() async {
    final permission = await requestLocationPermission();

    var isLocationServiceEnabled = await verifyLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      isLocationServiceEnabled = await requestLocationService();
    }

    return _geolocationProblemHandler(
      isPermissionGranted: permission,
      isLocationServiceGranted: isLocationServiceEnabled,
    );
  }

  /// returns true if there is no problem with permission
  @override
  Future<bool> verifyLocationPermission() async {
    return _permissionHandler(await Geolocator.checkPermission());
  }

  @override
  Future<GeolocationProblem> verifyLocationServiceAndPermission() async {
    final isLocationServiceEnabled = await verifyLocationServiceEnabled();
    final permission = await verifyLocationPermission();
    return _geolocationProblemHandler(
      isPermissionGranted: permission,
      isLocationServiceGranted: isLocationServiceEnabled,
    );
  }

  /// returns true if there is no problem with service
  @override
  Future<bool> verifyLocationServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  /// handles permission
  bool _permissionHandler(LocationPermission locationPermission) {
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  /// handles [GeolocationProblem] from function parameters
  GeolocationProblem _geolocationProblemHandler({
    required bool isPermissionGranted,
    required bool isLocationServiceGranted,
  }) {
    if (isPermissionGranted && isLocationServiceGranted) {
      return GeolocationProblem.noProblems;
    } else if (!isPermissionGranted && !isLocationServiceGranted) {
      return GeolocationProblem.both;
    } else if (!isPermissionGranted) {
      return GeolocationProblem.locationPermission;
    } else {
      return GeolocationProblem.locationService;
    }
  }
}
