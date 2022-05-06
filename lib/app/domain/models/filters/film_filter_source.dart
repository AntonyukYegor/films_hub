import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';

abstract class FilmFilterSource {
  AbstractFilter<Future<List<AbstractFilm>>> filter();

  void reset();
}
