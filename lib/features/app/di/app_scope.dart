import 'dart:ui';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:surf_study_project/api/service/place_api.dart';
import 'package:surf_study_project/config/app_config.dart';
import 'package:surf_study_project/config/environment/environment.dart';
import 'package:surf_study_project/features/common/domain/repository/geolocator_repository/geolocator_repository.dart';
import 'package:surf_study_project/features/common/domain/repository/place_repository/place_repository.dart';
import 'package:surf_study_project/features/common/domain/repository/shared_preferences/shared_preferences_storage.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';
import 'package:surf_study_project/features/common/service/geolocation_service.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/service/place_service.dart';
import 'package:surf_study_project/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final VoidCallback _applicationRebuilder;
  late final AppRouter _router;
  late final PlaceApi _placeApi;
  late final PlaceRepository _placeRepository;
  late final PlaceService _placeService;
  late final SharedPreferencesStorage _sharedPreferencesStorage;
  late final AppSettingsService _appSettingsService;
  late final GeolocatorRepository _geolocatorRepository;
  late final GeolocationService _geolocationService;

  @override
  VoidCallback get applicationRebuilder => _applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  PlaceApi get placeApi => _placeApi;

  @override
  PlaceRepository get placeRepository => _placeRepository;

  @override
  PlaceService get placeService => _placeService;

  @override
  AppSettingsService get appSettingsService => _appSettingsService;

  @override
  GeolocatorRepository get geolocatorRepository => _geolocatorRepository;

  @override
  GeolocationService get geolocationService => _geolocationService;

  /// Create an instance [AppScope].
  AppScope({
    required VoidCallback applicationRebuilder,
  }) : _applicationRebuilder = applicationRebuilder {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();

    _placeApi = PlaceApi(dio);
    _placeRepository = PlaceRepository(placeApi);
    _placeService = PlaceService(placeRepository);

    _sharedPreferencesStorage = SharedPreferencesStorage();
    _appSettingsService = AppSettingsService(_sharedPreferencesStorage);

    ///geolocation
    _geolocatorRepository = GeolocatorRepository();
    _geolocationService = GeolocationService(_geolocatorRepository);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment<AppConfig>.instance().config.url
      ..connectTimeout = timeout.inMilliseconds
      ..receiveTimeout = timeout.inMilliseconds
      ..sendTimeout = timeout.inMilliseconds;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = Environment<AppConfig>.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// Place API dependency
  PlaceApi get placeApi;

  /// Place Repository dependency
  PlaceRepository get placeRepository;

  /// Place Service dependency
  PlaceService get placeService;

  /// Service with global app settings
  AppSettingsService get appSettingsService;

  /// Geolocation repository
  GeolocatorRepository get geolocatorRepository;

  /// Service with geolocation
  GeolocationService get geolocationService;
}
