import 'package:films_hub/app/models/filters/abstract_filter.dart';

class EmptyFilter<T> implements AbstractFilter<T> {
  @override
  T apply(T source) {
    return source;
  }
}