import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_language_equals_condition.dart';
import 'package:films_hub/app/domain/models/filters/film_filter_source.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/domain/models/languages/extensions/named_language.dart';
import 'package:films_hub/app/domain/models/languages/language.dart';
import 'package:films_hub/app/domain/models/languages/language_filter_entry.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_event.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_state.dart';
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

  Iterable<Widget> get actorWidgets {
    return _cast.map((LanguageFilterEntry language) {
      final currentFilters = [
        ...context.read<FiltersBloc>().state.selectedLanguages
      ];

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: BlocBuilder<FiltersBloc, FiltersState>(
          buildWhen: (oldState, newState) =>
              oldState.selectedLanguages != newState.selectedLanguages,
          builder: (context, state) => FilterChip(
            label: Text(language.name),
            selected: currentFilters.contains(language.name),
            onSelected: (bool value) {
              if (value) {
                currentFilters.add(language.name);
              } else {
                currentFilters.removeWhere((String name) {
                  return name == language.name;
                });
              }
              context.read<FiltersBloc>().add(
                  ChangeLanguageFilterEvent(selectedLanguage: currentFilters));
            },
          ),
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
    context
        .read<FiltersBloc>()
        .add(const ChangeLanguageFilterEvent(selectedLanguage: []));
  }

  @override
  AbstractFilter<Future<List<AbstractFilm>>> filter() {
    final currentFilters = context.read<FiltersBloc>().state.selectedLanguages;
    if (currentFilters.isEmpty) {
      return FilmFutureListFilter.empty();
    }

    var filmConditions =
        currentFilters.map((f) => FilmLanguageEqualsCondition(f));
    return FilmFutureListFilter.anyCondition(filmConditions);
  }
}
