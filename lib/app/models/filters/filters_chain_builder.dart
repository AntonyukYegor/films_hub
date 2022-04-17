import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/abstract_filters_chain_builder.dart';
import 'package:films_hub/app/models/filters/base_filter.dart';
import 'package:films_hub/app/models/filters/function_filter.dart';

class FiltersChainBuilder<T> implements AbstractFiltersChainBuilder<T> {
  @override
  AbstractFilter<T> filtersChainBuild(Iterable<AbstractFilter<T>> filters) {
    if (filters.isEmpty) {
      return BaseFilter(FunctionFilter.noFiltered());
    }

    return (filters.length > 1)
        ? BaseFilter(filtersChainBuild(filters.skip(1)))
        : BaseFilter(filters.first);
  }
}
