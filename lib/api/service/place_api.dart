import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:surf_study_project/api/api_strings.dart';
import 'package:surf_study_project/api/data/place.dart';
import 'package:surf_study_project/api/data/place_dto.dart';
import 'package:surf_study_project/api/data/places_filter_request_dto.dart';

part 'place_api.g.dart';

/// Api client. Retrofit based
/// Has got 3 POST, 2 GET
@RestApi(baseUrl: ApiStrings.baseUrl)
abstract class PlaceApi {
  /// factory constructor
  factory PlaceApi(Dio dio, {String baseUrl}) = _PlaceApi;

  /// Запрос списка интересных мест с фильтром.
  /// Фильтр задается в теле запроса, список параметров смотри в [PlacesFilterRequestDto].
  /// Ответ в виде списка типа [PlaceDto].
  /// Если в запросе были указаны координаты точки и радиус, то в ответе будет расстояние между точкой и местом.
  @POST(ApiStrings.filteredPlaces)
  Future<List<PlaceDto>> getFilteredPlaces(
    @Body() PlacesFilterRequestDto response,
  );

  /// POST [Place]
  @POST(ApiStrings.place)
  Future<Place> postPlace(
    @Body() Place request,
  );

  /// GET [List] of [Place]
  /// [count] - count of places in the list
  /// [offset] - offset from the first [Place] in the API
  @GET(ApiStrings.place)
  Future<List<Place>> getPlace(
    @Query('count') int count,
    @Query('offset') int offset,
  );

  /// GET [Place]
  /// [id] - id of the required Place
  @GET('${ApiStrings.place}/{id}')
  Future<Place> getPlaceById(
    @Path('id') String id,
  );

  /// Сохранение файлов в хранилище.
  /// В ответ приходит путь к загруженному файлу, относительно текущего домена.
  /// Данные передаются в multipart/form-data
  /// Допустимые типы файлов: jpg, png, gif, svg.
  /// Если загружен один файл, то путь к нему содержится в заголовке "location".
  /// Если в запросе было больше одного файла, то ответ в виде списка путей к загруженным файлам в теле ответа.
  @POST(ApiStrings.uploadFile)
  Future<HttpResponse<dynamic>> uploadFile(
    @Part() List<MultipartFile> files,
  );
}
