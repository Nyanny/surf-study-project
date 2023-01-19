part of 'geolocation_bloc.dart';

/// Basic bloc event class
@immutable
abstract class GeolocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// get current location event
class GetCurrentLocationEvent extends GeolocationEvent {
  @override
  List<Object> get props => [];
}

/// open app settings event
class OpenAppSettingsEvent extends GeolocationEvent {
  @override
  List<Object> get props => [];
}

/// verify location service and permission event
class VerifyThenRequestPermissionEvent extends GeolocationEvent {
  @override
  List<Object> get props => [];
}