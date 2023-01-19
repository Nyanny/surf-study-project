import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_coordinates.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_problem.dart';
import 'package:surf_study_project/features/common/service/geolocation/geolocation_service.dart';

part 'geolocation_event.dart';

part 'geolocation_state.dart';

/// Bloc class for geolocation
class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {

  /// GeolocationService instance
  final GeolocationService _geolocationService;

  /// constructor
  GeolocationBloc(this._geolocationService) : super(GeolocationInitial()) {
    on<VerifyThenRequestPermissionEvent>(_verifyPermissions);
    on<GetCurrentLocationEvent>(_getCurrentLocation);
    on<OpenAppSettingsEvent>(_openAppsSettings);
  }

  /// gets current location
  Future<void> _getCurrentLocation(
    GetCurrentLocationEvent event,
    Emitter<GeolocationState> emit,
  ) async {
    try {
      late GeolocationCoordinates geolocation;
      emit(GeolocationLoading());
      final permissions = await _geolocationService
          .verifyAndRequestLocationServiceAndPermission();

      /// checks are permissions granted
      if (permissions == GeolocationProblem.noProblems) {
        geolocation = await _geolocationService.getCurrentPosition();
        emit(GeolocationLoaded(geolocation: geolocation));
      } else {
        emit(GeolocationError(
          geolocationProblem: permissions,
        ));
      }
    } on Exception catch (_) {
      emit(GeolocationError(
        geolocationProblem: GeolocationProblem.unknown,
      ));
    }
  }

  /// opens settings with location setting
  Future<void> _openAppsSettings(
    OpenAppSettingsEvent event,
    Emitter<GeolocationState> emit,
  ) async {
    emit(AppSettingsIsOpenning());
    await _geolocationService.openAppSettings();
  }

  /// verifies both: app geolocation permission and location service setting
  Future<void> _verifyPermissions(
    VerifyThenRequestPermissionEvent event,
    Emitter<GeolocationState> emit,
  ) async {
    emit(GeolocationLoading());
    final permission = await _geolocationService
        .verifyAndRequestLocationServiceAndPermission();
    if (permission == GeolocationProblem.noProblems) {
      emit(GeolocationPermissionGranted());
    } else {
      emit(GeolocationPermissionDenied(geolocationProblem: permission));
    }
  }
}
