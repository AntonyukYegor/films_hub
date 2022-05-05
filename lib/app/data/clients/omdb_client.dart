import 'package:dio/dio.dart';
import 'package:films_hub/app/data/clients/omdb_client_api_keys_container.dart';
import 'package:films_hub/app/data/dtos/omdb/movie_details_omdb_dto.dart';
import 'package:films_hub/app/data/dtos/omdb/movies_with_details_omdb_to_response.dart';
import 'package:films_hub/app/data/dtos/omdb/search_by_title_response_omdb_dto.dart';
import 'package:films_hub/app/data/repositories/interceptors/dio_error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class OMDBClient {
  late final Dio _dio = Dio()
    ..interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
      ErrorInterceptor(_onErrorHandler),
    ]);

  final Function(String, String) _onErrorHandler;

  static final OMDBClientApiKeysContainer _apiKeysContainer =
      OMDBClientApiKeysContainer();

  static const _baseURL = 'https://www.omdbapi.com/?apikey=';

  OMDBClient({required Function(String, String) onErrorHandler})
      : _onErrorHandler = onErrorHandler;

  String get _currentBaseURL => _baseURL + _apiKeysContainer.getApiKey();

  Future<SearchByTitleResponseOMDBDTO> _search(
      {required String searchQuery, int page = 1}) async {
    String url = '$_currentBaseURL&type=movie';
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      queryParameters: <String, dynamic>{
        'page': page,
        's': searchQuery,
      },
    );

    return SearchByTitleResponseOMDBDTO.fromJson(response.data);
  }

  Future<MovieDetailsOMDBDTO> _loadMovieDetail({required String imdbID}) async {
    String url = '$_currentBaseURL&plot=full';
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      queryParameters: <String, dynamic>{'i': imdbID},
    );

    return MovieDetailsOMDBDTO.fromJson(response.data);
  }

  Future<MoviesWithDetailsOMDBDTOResponse> searchWithDetails(
      {required String searchQuery,
      int page = 1,
      void Function(String errorMessage)? errorCallback}) async {
    try {
      var searchResponse = _search(searchQuery: searchQuery, page: page);

      var movies = Future.wait(
        (await searchResponse).search.map(
              (e) => _loadMovieDetail(
                imdbID: e.imdbID,
              ),
            ),
      );
      return MoviesWithDetailsOMDBDTOResponse(
          int.tryParse((await searchResponse).totalResults) ?? 0, await movies);
    } on DioError catch (error) {
      final statusCode = error.toString(); //error.response?.statusCode;
      errorCallback?.call(statusCode.toString());
      return MoviesWithDetailsOMDBDTOResponse(0, []);
    }
  }
}
