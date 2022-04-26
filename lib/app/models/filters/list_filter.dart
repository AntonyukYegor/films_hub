import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/models/filters/conditions/condition_list_filter.dart';
import 'package:films_hub/app/models/filters/filter.dart';

class ListFilter<T> extends Filter<List<T>> {
  ListFilter.empty() : super.empty();

  ListFilter.condition(AbstractCondition<T> condition)
      : super([ConditionListFilter(condition)]);

  ListFilter.everyConditions(Iterable<AbstractCondition<T>> conditions)
      : this.condition(AggregateCondition(conditions));

  ListFilter.anyCondition(Iterable<AbstractCondition<T>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  ListFilter(Iterable<AbstractFilter<List<T>>> filters) : super(filters);
}
