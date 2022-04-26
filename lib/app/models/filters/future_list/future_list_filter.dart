import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/models/filters/future_list/condition_future_list_filter.dart';
import 'package:films_hub/app/models/filters/filter.dart';

class FutureListFilter<T> extends Filter<Future<List<T>>> {
  FutureListFilter.empty() : super.empty();

  FutureListFilter.condition(AbstractCondition<T> condition)
      : super([ConditionFutureListFilter(condition)]);

  FutureListFilter.everyConditions(Iterable<AbstractCondition<T>> conditions)
      : this.condition(AggregateCondition(conditions));

  FutureListFilter.anyCondition(Iterable<AbstractCondition<T>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  FutureListFilter(Iterable<AbstractFilter<Future<List<T>>>> filters)
      : super(filters);
}
