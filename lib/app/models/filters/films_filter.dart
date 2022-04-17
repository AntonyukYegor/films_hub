import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/abstract_filters_chain_builder.dart';
import 'package:films_hub/app/models/filters/base_filter.dart';
import 'package:films_hub/app/models/filters/function_filter.dart';

class FilmsFilter extends BaseFilter<AbstractFilm> {
  FilmsFilter.clampByVoteAverage(double min, double max)
      : this(FunctionFilter<AbstractFilm>(
            (film) => film.voteAverage >= min && film.voteAverage <= max));

  FilmsFilter.containsPattern(String pattern)
      : this(FunctionFilter<AbstractFilm>((film) {
          return _patternContains(
            [
              film.title,
              film.description,
            ],
            pattern,
          );
        }));

  FilmsFilter.containsCaseInsensitivePattern(String pattern)
      : this(FunctionFilter<AbstractFilm>((film) {
          return _patternContains(
            [
              film.title.toLowerCase(),
              film.description.toLowerCase(),
            ],
            pattern.toLowerCase(),
          );
        }));

  static bool _patternContains(Iterable<String> sources, String pattern) {
    for (var source in sources) {
      if (source.contains(pattern)) {
        return true;
      }
    }
    return false;
  }

  FilmsFilter.chain(AbstractFiltersChainBuilder<AbstractFilm> chainBuilder,
      Iterable<AbstractFilter<AbstractFilm>> filterChainLinks)
      : super.chain(chainBuilder, filterChainLinks);

  FilmsFilter(AbstractFilter<AbstractFilm> filter) : super(filter);
}
