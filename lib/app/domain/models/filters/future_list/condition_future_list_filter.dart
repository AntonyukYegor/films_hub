import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/abstract_condition.dart';

class ConditionFutureListFilter<T> implements AbstractFilter<Future<List<T>>> {
  final AbstractCondition<T> _condition;

  ConditionFutureListFilter(this._condition);

  @override
  Future<List<T>> apply(Future<List<T>> source) async {
    return (await source)
        .where((element) => _condition.check(element))
        .toList();
  }
}
