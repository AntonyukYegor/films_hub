import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';

class FilteringPageState extends Equatable {
  final AbstractFilms films;
  final AbstractFilms filteredFilms;

  final bool showShimmer;

  final bool isLoading;
  final int page;
  final String searchText;
  final FilteringPageEvent lastEvent;

  final AbstractFilter<Future<List<AbstractFilm>>> currentFilter;

  FilteringPageState(
      {required this.films,
      required this.filteredFilms,
      required this.searchText,
      required this.isLoading,
      required this.showShimmer,
      FilteringPageEvent? event,
      int? page = 1,
      AbstractFilter<Future<List<AbstractFilm>>>? filter})
      : lastEvent = event ?? BaseFilteringPageEvent(),
        page = page ?? 1,
        currentFilter = filter ?? FilmFutureListFilter.empty();

  FilteringPageState copyWith({
    String? searchText,
    AbstractFilms? films,
    AbstractFilms? filteredFilms,
    bool? isLoading,
    bool? showShimmer,
    FilteringPageEvent? event,
    int? page,
    AbstractFilter<Future<List<AbstractFilm>>>? filter,
  }) =>
      FilteringPageState(
        films: films ?? this.films,
        searchText: searchText ?? this.searchText,
        isLoading: isLoading ?? this.isLoading,
        showShimmer: showShimmer ?? this.showShimmer,
        page: page ?? this.page,
        event: event ?? lastEvent,
        filteredFilms: filteredFilms ?? this.filteredFilms,
        filter: filter ?? currentFilter,
      );

  @override
  List<Object> get props => [
        page,
        searchText,
        isLoading,
        showShimmer,
        films,
        filteredFilms,
        currentFilter,
        lastEvent,
      ];
}
