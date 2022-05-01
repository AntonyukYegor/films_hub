import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_contains_pattern_condition.dart';
import 'package:films_hub/app/domain/models/filters/film_filter_source.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:flutter/material.dart';

class FilmContainsPatternFilter extends StatefulWidget {
  const FilmContainsPatternFilter({Key? key}) : super(key: key);

  @override
  State<FilmContainsPatternFilter> createState() =>
      FilmContainsPatternFilterState();
}

class FilmContainsPatternFilterState extends State<FilmContainsPatternFilter>
    implements FilmFilterSource {
  late TextEditingController _controller;
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onSearchFieldTextChanged,
      autofocus: false,
    );
  }

  void _onSearchFieldTextChanged(String text) {
    setState(() {
      _currentText = text;
    });
  }

  @override
  void reset() {
    setState(() {
      _currentText = "";
      _controller.value = TextEditingValue.empty;
    });
  }

  @override
  AbstractFilter<Future<List<AbstractFilm>>> filter() {
    if (_currentText.isEmpty) {
      return FilmFutureListFilter.empty();
    }

    return FilmFutureListFilter.condition(
      FilmContainsPatternCondition(_currentText),
    );
  }
}
