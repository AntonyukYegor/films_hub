import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';

class LambdaCondition<T> implements AbstractCondition<T> {
  final bool Function(T) _conditionFunction;

  LambdaCondition(this._conditionFunction);

  @override
  bool check(T source) {
    return _conditionFunction(source);
  }
}
