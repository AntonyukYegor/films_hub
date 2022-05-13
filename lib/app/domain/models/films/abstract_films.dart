import 'package:films_hub/app/domain/models/films/abstract_film.dart';

abstract class AbstractFilms {
  int get totalCount;

  int get pagesCount;

  List<AbstractFilm> get films;

  void addAll(Iterable<AbstractFilm> value);

  void update(AbstractFilms films);

  void clear();
}
