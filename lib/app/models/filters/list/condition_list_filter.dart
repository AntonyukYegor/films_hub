import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/conditions/abstract_condition.dart';

class ConditionListFilter<T> implements AbstractFilter<List<T>> {
  final AbstractCondition<T> _condition;

  ConditionListFilter(this._condition);

  @override
  List<T> apply(List<T> source) {
    return source.where((element) => _condition.check(element)).toList();
  }
}
