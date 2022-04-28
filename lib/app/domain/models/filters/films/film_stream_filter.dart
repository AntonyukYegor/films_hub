import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/stream/condition_stream_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/domain/models/filters/stream/stream_filter.dart';

class FilmStreamFilter extends StreamFilter<AbstractFilm> {
  FilmStreamFilter.empty() : super.empty();

  FilmStreamFilter.condition(AbstractCondition<AbstractFilm> condition)
      : super([ConditionStreamFilter(condition)]);

  FilmStreamFilter.everyConditions(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AggregateCondition(conditions));

  FilmStreamFilter.anyCondition(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  FilmStreamFilter(Iterable<AbstractFilter<Stream<AbstractFilm>>> filters)
      : super(filters);
}
