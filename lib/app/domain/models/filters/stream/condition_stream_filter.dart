import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';

class ConditionStreamFilter<T> implements AbstractFilter<Stream<T>> {
  final AbstractCondition<T> _condition;

  ConditionStreamFilter(this._condition);

  @override
  Stream<T> apply(Stream<T> source) async* {
    yield* source.where((event) => _condition.check(event));
  }
}
