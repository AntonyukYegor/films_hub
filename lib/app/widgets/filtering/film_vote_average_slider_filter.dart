import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/abstract_filter.dart';
import 'package:films_hub/app/models/filters/conditions/films/film_clamp_by_vote_average_condition.dart';
import 'package:films_hub/app/models/filters/film_filter_source.dart';
import 'package:films_hub/app/models/filters/films/film_future_list_filter.dart';
import 'package:flutter/material.dart';

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
      },
      values: _currentRangeValues,
    );
  }

  @override
  void reset() {
    setState(() {
      _currentRangeValues = _defaultRangeValues;
    });
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
