import 'package:films_hub/app/models/filters/abstract_filter.dart';

class BaseFilter<T> implements AbstractFilter<T> {
  final Iterable<AbstractFilter<T>> _filterChainLinks;

  BaseFilter.chain(this._filterChainLinks);

  BaseFilter(AbstractFilter<T> filter) : this.chain([filter]);

  @override
  Stream<T> apply(Stream<T> source) async* {
    yield* _filterFunc(source, _filterChainLinks);
  }

  Stream<T> _filterFunc(
      Stream<T> source, Iterable<AbstractFilter<T>> filters) async* {
    yield* (filters.isEmpty)
        ? source
        : _filterFunc(filters.first.apply(source), filters.skip(1));
  }
}
