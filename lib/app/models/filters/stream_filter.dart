import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/condition_stream_filter.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/models/filters/conditions/aggregate_condition.dart';
import 'package:films_hub/app/models/filters/conditions/any_aggregate_condition.dart';
import 'package:films_hub/app/models/filters/filter.dart';

class StreamFilter<T> extends Filter<Stream<T>> {
  StreamFilter.empty() : super.empty();

  StreamFilter.condition(AbstractCondition<T> condition)
      : super([ConditionStreamFilter(condition)]);

  StreamFilter.everyConditions(Iterable<AbstractCondition<T>> conditions)
      : this.condition(AggregateCondition(conditions));

  StreamFilter.anyCondition(Iterable<AbstractCondition<T>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  StreamFilter(Iterable<AbstractFilter<Stream<T>>> filters) : super(filters);
}
