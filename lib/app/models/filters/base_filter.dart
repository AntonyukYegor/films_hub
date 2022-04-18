import 'package:films_hub/app/models/filters/abstract_filter.dart';

class BaseFilter<T> implements AbstractFilter<T> {
  final Iterable<AbstractFilter<T>> _filterChainLinks;

  BaseFilter.empty() : this.chain([]);

  BaseFilter(AbstractFilter<T> filter) : this.chain([filter]);

  BaseFilter.chain(this._filterChainLinks);

  @override
  Stream<T> apply(Stream<T> source) async* {
    var result = source;

    for (final filter in _filterChainLinks) {
      result = filter.apply(result);
    }

    yield* result;
  }
}
