import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/empty_filter.dart';

class Filter<C> implements AbstractFilter<C> {
  final Iterable<AbstractFilter<C>> _filters;

  Filter.empty() : this([EmptyFilter()]);

  Filter(this._filters);

  @override
  C apply(C source) {
    C result = source;
    for (final filter in _filters) {
      result = filter.apply(result);
    }
    return result;
  }
}