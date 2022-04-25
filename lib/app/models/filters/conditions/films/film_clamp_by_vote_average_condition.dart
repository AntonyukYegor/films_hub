import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';

class FilmClampByVoteAverageCondition implements AbstractCondition<AbstractFilm> {
  final double _min;
  final double _max;

  FilmClampByVoteAverageCondition(this._min, this._max);

  @override
  bool check(AbstractFilm source) {
    return source.voteAverage >= _min && source.voteAverage <= _max;
  }
}