import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';
import 'package:flutter/foundation.dart';

class AggregateCondition<T> implements AbstractCondition<T> {
  @protected
  final Iterable<AbstractCondition<T>> conditions;

  AggregateCondition.single(AbstractCondition<T> condition) : this([condition]);

  AggregateCondition(this.conditions);

  @override
  bool check(T source) {
    return conditions.every((element) => element.check(source));
  }
}