import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/domain/models/filters/future_list/condition_future_list_filter.dart';
import 'package:films_hub/app/domain/models/filters/future_list/future_list_filter.dart';

class FilmFutureListFilter extends FutureListFilter<AbstractFilm> {
  FilmFutureListFilter.empty() : super.empty();

  FilmFutureListFilter.condition(AbstractCondition<AbstractFilm> condition)
      : super([ConditionFutureListFilter(condition)]);

  FilmFutureListFilter.everyConditions(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AggregateCondition(conditions));

  FilmFutureListFilter.anyCondition(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  FilmFutureListFilter(
      Iterable<AbstractFilter<Future<List<AbstractFilm>>>> filters)
      : super(filters);
}
