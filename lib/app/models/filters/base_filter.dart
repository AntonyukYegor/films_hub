import 'package:films_hub/app/models/filters/abstract_filter.dart';

class BaseFilter<T> implements AbstractFilter<T> {
  final Iterable<AbstractFilter<T>> _filterChainLinks;

  BaseFilter.empty() : this.chain([]);

  BaseFilter(AbstractFilter<T> filter) : this.chain([filter]);

  BaseFilter.chain(this._filterChainLinks);

  @override
  Stream<T> applyToStream(Stream<T> source) async* {
    var result = source;

    for (final filter in _filterChainLinks) {
      result = filter.applyToStream(result);
    }

    yield* result;
  }

  @override
  Future<List<T>> applyToList(List<T> source) async {
    var result = source;

    for (final filter in _filterChainLinks) {
      result = await filter.applyToList(result);
    }

    return Future.value(result);
  }

  @override
  List<T> applyToListSync(List<T> source) {
    var result = source;

    for (final filter in _filterChainLinks) {
      result = filter.applyToListSync(result);
    }

    return result;
  }
}
