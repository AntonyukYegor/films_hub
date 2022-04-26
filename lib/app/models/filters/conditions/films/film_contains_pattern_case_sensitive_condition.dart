import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/conditions/films/film_contains_pattern_condition.dart';

class FilmContainsPatternCaseSensitiveCondition
    extends FilmContainsPatternCondition {
  FilmContainsPatternCaseSensitiveCondition(String pattern) : super(pattern);

  @override
  bool check(AbstractFilm source) {
    return source.title.contains(pattern) ||
        source.description.contains(pattern);
  }
}
