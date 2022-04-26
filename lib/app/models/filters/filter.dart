import 'package:films_hub/app/models/filters/abstract_filter.dart';

class Filter<T> implements AbstractFilter<T> {
  final Iterable<AbstractFilter<T>> _filters;

  Filter.empty() : this([]);

  Filter(this._filters);

  @override
  T apply(T source) {
    T result = source;
    for (final filter in _filters) {
      result = filter.apply(result);
    }
    return result;
  }
}