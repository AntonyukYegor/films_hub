import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';

class FilteringPageState extends Equatable {
  final AbstractFilms filteredFilms;
  final AbstractFilms sourceFilms;

  final AbstractFilter<Future<List<AbstractFilm>>> currentFilter;

  FilteringPageState(
      {required this.filteredFilms,
        AbstractFilms? sourceFilms,
      int? page = 1,
      AbstractFilter<Future<List<AbstractFilm>>>? filter})
      : currentFilter = filter ?? FilmFutureListFilter.empty(), sourceFilms = sourceFilms ?? Films(0,[]);

  FilteringPageState copyWith({
    AbstractFilms? filteredFilms,
    AbstractFilms? sourceFilms,
    AbstractFilter<Future<List<AbstractFilm>>>? filter,
  }) =>
      FilteringPageState(
        filteredFilms: filteredFilms ?? this.filteredFilms,
        filter: filter ?? currentFilter,
        sourceFilms: sourceFilms ?? this.sourceFilms,
      );

  @override
  List<Object> get props => [
        filteredFilms,
        currentFilter,
      ];
}
