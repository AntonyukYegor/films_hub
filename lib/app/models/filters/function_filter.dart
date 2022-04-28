import 'dart:async';
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
  Stream<T> applyToStream(Stream<T> source) async* {
    yield* source.where((event) => _filterFunction(event));
  }

  @override
  Future<List<T>> applyToList(List<T> source) async {
    return Future.value(
        await applyToStream(Stream.fromIterable(source)).toList());
  }

  @override
  List<T> applyToListSync(List<T> source) {
    return source.where((event) => _filterFunction(event)).toList();
  }
}
