import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_language_equals_condition.dart';
import 'package:films_hub/app/domain/models/filters/film_filter_source.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/domain/models/languages/extensions/named_language.dart';
import 'package:films_hub/app/domain/models/languages/language.dart';
import 'package:films_hub/app/domain/models/languages/language_filter_entry.dart';
import 'package:films_hub/app/presentation/features/filtering/filters_bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters_bloc/filters_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmLanguageFilter extends StatefulWidget {
  const FilmLanguageFilter({Key? key}) : super(key: key);

  @override
  State createState() => FilmLanguageFilterState();
}

class FilmLanguageFilterState extends State<FilmLanguageFilter>
    implements FilmFilterSource {
  final List<LanguageFilterEntry> _cast = <LanguageFilterEntry>[
    ...Language.values.map((l) => LanguageFilterEntry(l.toPrettyString()))
  ];

  final List<String> _filters = <String>[];

  @override
  void initState() {
    super.initState();
    _filters.clear();
    _filters.addAll(context.read<FiltersBloc>().state.selectedLanguages);
  }

  Iterable<Widget> get actorWidgets {
    return _cast.map((LanguageFilterEntry language) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(language.name),
          selected: _filters.contains(language.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(language.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == language.name;
                });
              }
              context
                  .read<FiltersBloc>()
                  .add(ChangeLanguageFilterEvent(selectedLanguage: _filters));
            });
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: actorWidgets.toList(),
      ),
    );
  }

  @override
  void reset() {
    setState(() {
      _filters.clear();
      context
          .read<FiltersBloc>()
          .add(ChangeLanguageFilterEvent(selectedLanguage: _filters));
    });
  }

  @override
  AbstractFilter<Future<List<AbstractFilm>>> filter() {
    if (_filters.isEmpty) {
      return FilmFutureListFilter.empty();
    }

    var filmConditions = _filters.map((f) => FilmLanguageEqualsCondition(f));
    return FilmFutureListFilter.anyCondition(filmConditions);
  }
}
