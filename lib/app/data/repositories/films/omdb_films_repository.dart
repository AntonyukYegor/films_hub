import 'package:films_hub/app/data/clients/omdb_client.dart';
import 'package:films_hub/app/data/mappers/omdb/movie_details_omdb_from_dto_to_domain.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';

class OMDBFilmsRepository implements AbstractFilmsRepository {
  static final OMDBClient _client = OMDBClient();

  const OMDBFilmsRepository();

  @override
  Stream<AbstractFilm> filmsAsStream(
      {String searchQuery = "",
      int page = 1,
      void Function(String errorMessage)? errorCallback}) async* {
    var films = await filmsAsync(searchQuery: searchQuery, errorCallback: errorCallback);
    for (var film in films) {
      yield film;
    }
  }

  @override
  Future<List<AbstractFilm>> filmsAsync(
      {String searchQuery = "",
      int page = 1,
      void Function(String errorMessage)? errorCallback}) async {
    return Future.wait(
      (await _client.searchWithDetails(
        searchQuery: searchQuery,
        errorCallback: errorCallback,
      ))
          .map(
        (e) async => e.toDomain(),
      ),
    );
  }
}
