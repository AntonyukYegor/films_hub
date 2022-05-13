import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';

abstract class AbstractFilmsRepository {
  Stream<AbstractFilm> filmsAsStream({String searchQuery = "", int page = 1});

  Future<AbstractFilms> filmsAsync({String searchQuery = "", int page = 1});
}
