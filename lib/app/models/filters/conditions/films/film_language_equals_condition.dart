import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';

class FilmLanguageEqualsCondition implements AbstractCondition<AbstractFilm> {
  final String _language;

  FilmLanguageEqualsCondition(this._language);

  @override
  bool check(AbstractFilm source) {
    return source.language == _language;
  }
}
