import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocator_status.dart';

/// Class [GeolocatorException] is a [Exception] that holds [GeolocatorStatus] and [String] message
class GeolocatorException implements Exception {
  /// [GeolocatorStatus] enum
  final GeolocatorStatus geolocatorStatus;

  /// Exception Message
  final String exceptionMessage;

  /// constructor
  GeolocatorException({
    required this.geolocatorStatus,
    required this.exceptionMessage,
  }) : super();
}
