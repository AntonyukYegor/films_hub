import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_clamp_by_vote_average_condition.dart';
import 'package:films_hub/app/domain/models/filters/film_filter_source.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_event.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmVoteAverageSliderFilter extends StatefulWidget {
  const FilmVoteAverageSliderFilter({Key? key}) : super(key: key);

  @override
  State<FilmVoteAverageSliderFilter> createState() =>
      FilmVoteAverageSliderFilterState();
}

class FilmVoteAverageSliderFilterState
    extends State<FilmVoteAverageSliderFilter> implements FilmFilterSource {
  static const RangeValues _defaultRangeValues = RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      final currentRange = context.read<FiltersBloc>().state.voteAverageRange;
      return RangeSlider(
        min: _defaultRangeValues.start.toDouble(),
        max: _defaultRangeValues.end.toDouble(),
        divisions: 100,
        labels: RangeLabels(
          currentRange.start.toStringAsFixed(1).toString(),
          currentRange.end.toStringAsFixed(1).toString(),
        ),
        onChanged: (RangeValues values) {
          context
              .read<FiltersBloc>()
              .add(ChangeVoteAverageRangeEvent(range: values));
        },
        values: currentRange,
      );
    });
  }

  @override
  void reset() {
    context
        .read<FiltersBloc>()
        .add(const ChangeVoteAverageRangeEvent(range: _defaultRangeValues));
  }

  @override
  AbstractFilter<Future<List<AbstractFilm>>> filter() {
    final currentRange = context.read<FiltersBloc>().state.voteAverageRange;
    if (currentRange == _defaultRangeValues) {
      return FilmFutureListFilter.empty();
    }

    return FilmFutureListFilter.condition(
      FilmClampByVoteAverageCondition(
        currentRange.start,
        currentRange.end,
      ),
    );
  }
}
