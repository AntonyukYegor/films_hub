import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';

class AllConditionedCondition<T> implements AbstractCondition<T> {
  @override
  bool check(T source) {
    return true;
  }
}
