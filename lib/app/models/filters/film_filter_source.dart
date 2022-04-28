import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/abstract_filter.dart';

abstract class FilmFilterSource {
  AbstractFilter<Future<List<AbstractFilm>>> filter();

  void reset();
}
