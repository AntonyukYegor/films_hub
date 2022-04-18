import 'package:films_hub/app/models/films/abstract_film.dart';

abstract class AbstractFilmsRepository {
  Stream<AbstractFilm> filmsAsStream();

  Future<List<AbstractFilm>> filmsAsync();

  List<AbstractFilm> films();
}
