import 'package:films_hub/app/data/services/db/drift_db_movies_service.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';

class FavouritesFilmsRepository implements AbstractFilmsRepository {
  FavouritesFilmsRepository({required DriftDBMoviesService service})
      : _service = service;

  final DriftDBMoviesService _service;

  @override
  Stream<AbstractFilm> filmsAsStream(
      {String searchQuery = "", int page = 1}) async* {
    var films = await _service.getAllMoviesDB();
    for (final film in films.films) {
      yield film;
    }
  }

  @override
  Future<AbstractFilms> filmsAsync(
      {String searchQuery = "", int page = 1}) async {
    return await _service.getAllMoviesDB();
  }
}
