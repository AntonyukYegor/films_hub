import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:films_hub/app/models/filters/conditions/aggregate_condition.dart';

class AnyAggregateCondition<T> extends AggregateCondition<T> {
  AnyAggregateCondition.single(AbstractCondition<T> condition)
      : super.single(condition);

  AnyAggregateCondition(Iterable<AbstractCondition<T>> conditions)
      : super(conditions);

  @override
  bool check(T source) {
    return conditions.any(((element) => element.check(source)));
  }
}
