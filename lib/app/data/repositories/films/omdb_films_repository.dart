import 'package:films_hub/app/data/services/dio/omdb_service.dart';
import 'package:films_hub/app/data/mappers/omdb/movie_details_omdb_from_dto_to_domain.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';

class OMDBFilmsRepository implements AbstractFilmsRepository {
  final OMDBService _client;

  OMDBFilmsRepository({required OMDBService client}) : _client = client;

  @override
  Stream<AbstractFilm> filmsAsStream(
      {String searchQuery = "", int page = 1}) async* {
    var films = await filmsAsync(
      searchQuery: searchQuery,
      page: page,
    );
    for (var film in films.films) {
      yield film;
    }
  }

  @override
  Future<AbstractFilms> filmsAsync(
      {String searchQuery = "", int page = 1}) async {
    return (await _client.searchWithDetails(
      searchQuery: searchQuery,
      page: page,
    ))
        .toDomain();
  }
}
