import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/abstract_filters_chain_builder.dart';

class BaseFilter<T> implements AbstractFilter<T> {
  final AbstractFilter<T> _filter;

  BaseFilter.chain(AbstractFiltersChainBuilder<T> chainBuilder,
      Iterable<AbstractFilter<T>> filterChainLinks)
      : this(chainBuilder.filtersChainBuild(filterChainLinks));

  BaseFilter(this._filter);

  @override
  Stream<T> apply(Stream<T> source) async* {
    yield* _filter.apply(source);
  }
}
