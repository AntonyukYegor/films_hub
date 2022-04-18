import 'package:films_hub/app/models/filters/abstract_filter.dart';

class FunctionFilter<T> implements AbstractFilter<T> {
  final bool Function(T) _filterFunction;

  FunctionFilter.all(Iterable<bool Function(T)> filterFunctions)
      : this.single((value) {
          return filterFunctions.every((filter) => filter(value));
        });

  FunctionFilter.any(Iterable<bool Function(T)> filterFunctions)
      : this.single((value) {
          return filterFunctions.any((filter) => filter(value));
        });

  FunctionFilter.single(bool Function(T) filterFunction) : this(filterFunction);

  FunctionFilter.noFiltered() : this((value) => true);

  FunctionFilter(this._filterFunction);

  @override
  Stream<T> apply(Stream<T> source) async* {
    yield* source.where((event) => _filterFunction(event));
  }
}
