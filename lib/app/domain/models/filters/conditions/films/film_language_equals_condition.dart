import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';

class FilmLanguageEqualsCondition implements AbstractCondition<AbstractFilm> {
  final String _language;

  FilmLanguageEqualsCondition(this._language);

  @override
  bool check(AbstractFilm source) {
    return source.language == _language;
  }
}