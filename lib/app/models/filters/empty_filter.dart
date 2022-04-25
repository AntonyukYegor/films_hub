import 'package:films_hub/app/models/filters/abstract_filter.dart';

class EmptyFilter<C> implements AbstractFilter<C> {
  @override
  C apply(C source) {
    return source;
  }
}