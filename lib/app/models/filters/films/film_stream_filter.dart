import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/condition_stream_filter.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/models/filters/stream_filter.dart';

class FilmStreamFilter extends StreamFilter<AbstractFilm> {
  FilmStreamFilter.empty() : super.empty();

  FilmStreamFilter.condition(AbstractCondition<AbstractFilm> condition)
      : super([ConditionStreamFilter(condition)]);

  FilmStreamFilter.everyConditions(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AggregateCondition(conditions));

  FilmStreamFilter.anyCondition(Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  FilmStreamFilter(Iterable<AbstractFilter<Stream<AbstractFilm>>> filters)
      : super(filters);
}