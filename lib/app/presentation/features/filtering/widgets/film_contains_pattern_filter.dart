import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_contains_pattern_condition.dart';
import 'package:films_hub/app/domain/models/filters/film_filter_source.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/filters_bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters_bloc/filters_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmContainsPatternFilter extends StatefulWidget {
  const FilmContainsPatternFilter({Key? key}) : super(key: key);

  @override
  State<FilmContainsPatternFilter> createState() =>
      FilmContainsPatternFilterState();
}

class FilmContainsPatternFilterState extends State<FilmContainsPatternFilter>
    implements FilmFilterSource {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = context.read<FiltersBloc>().state.textPattern;
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
    context
        .read<FiltersBloc>()
        .add(ChangeFilterPatternEvent(textPattern: text));
  }

  @override
  void reset() {
    setState(() {
      _controller.value = TextEditingValue.empty;
    });
    context
        .read<FiltersBloc>()
        .add(const ChangeFilterPatternEvent(textPattern: ""));
  }

  @override
  AbstractFilter<Future<List<AbstractFilm>>> filter() {
    final currentText = context.read<FiltersBloc>().state.textPattern;
    if (currentText.isEmpty) {
      return FilmFutureListFilter.empty();
    }

    return FilmFutureListFilter.condition(
      FilmContainsPatternCondition(currentText),
    );
  }
}
