import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/domain/models/filters/list/condition_list_filter.dart';
import 'package:films_hub/app/domain/models/filters/list/list_filter.dart';

class FilmListFilter extends ListFilter<AbstractFilm> {
  FilmListFilter.empty() : super.empty();

  FilmListFilter.condition(AbstractCondition<AbstractFilm> condition)
      : super([ConditionListFilter(condition)]);

  FilmListFilter.everyConditions(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AggregateCondition(conditions));

  FilmListFilter.anyCondition(
      Iterable<AbstractCondition<AbstractFilm>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  FilmListFilter(Iterable<AbstractFilter<List<AbstractFilm>>> filters)
      : super(filters);
}
