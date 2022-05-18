import 'package:films_hub/app/components/delayed_action.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_clamp_by_vote_average_condition.dart';
import 'package:films_hub/app/domain/models/filters/film_filter_source.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_event.dart';
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
  RangeValues _currentRangeValues = _defaultRangeValues;
  static const RangeValues _defaultRangeValues = RangeValues(0, 10);

  @override
  void initState() {
    super.initState();
    _currentRangeValues = context.read<FiltersBloc>().state.voteAverageRange;
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0.0,
      max: 10.0,
      divisions: 100,
      labels: RangeLabels(
        _currentRangeValues.start.toStringAsFixed(1).toString(),
        _currentRangeValues.end.toStringAsFixed(1).toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
        DelayedAction.run(() {
          context
              .read<FiltersBloc>()
              .add(ChangeVoteAverageRangeEvent(range: _currentRangeValues));
        });
      },
      values: _currentRangeValues,
    );
  }

  @override
  void reset() {
    setState(() {
      _currentRangeValues = _defaultRangeValues;
    });
    context
        .read<FiltersBloc>()
        .add(ChangeVoteAverageRangeEvent(range: _currentRangeValues));
  }

  @override
  AbstractFilter<Future<List<AbstractFilm>>> filter() {
    if (_currentRangeValues == _defaultRangeValues) {
      return FilmFutureListFilter.empty();
    }

    return FilmFutureListFilter.condition(
      FilmClampByVoteAverageCondition(
        _currentRangeValues.start,
        _currentRangeValues.end,
      ),
    );
  }
}
