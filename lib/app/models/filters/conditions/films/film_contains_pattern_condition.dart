import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:flutter/foundation.dart';

class FilmContainsPatternCondition implements AbstractCondition<AbstractFilm> {
  @protected
  final String pattern;

  FilmContainsPatternCondition(this.pattern);

  @override
  bool check(AbstractFilm source) {
    return source.title.toLowerCase().contains(pattern.toLowerCase()) ||
        source.description.toLowerCase().contains(pattern.toLowerCase());
  }
}
