import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';

class FilmContainsPatternCondition implements AbstractCondition<AbstractFilm> {
  final String pattern;

  FilmContainsPatternCondition(this.pattern);

  @override
  bool check(AbstractFilm source) {
    return source.title.toLowerCase().contains(pattern.toLowerCase()) ||
        source.description.toLowerCase().contains(pattern.toLowerCase());
  }
}
