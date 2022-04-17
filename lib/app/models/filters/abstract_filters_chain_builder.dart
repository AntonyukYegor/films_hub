import 'package:films_hub/app/models/filters/abstract_filter.dart';

abstract class AbstractFiltersChainBuilder<T> {
  AbstractFilter<T> filtersChainBuild(Iterable<AbstractFilter<T>> filters);
}
