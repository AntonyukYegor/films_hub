import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_event.dart';

class SearchPageState extends Equatable {
  final AbstractFilms films;
  final bool showShimmer;
  final bool isLoading;
  final int page;
  final String searchText;
  final SearchFromPageEvent lastEvent;

  SearchPageState({
    required this.films,
    required this.searchText,
    required this.isLoading,
    required this.showShimmer,
    SearchFromPageEvent? event,
    int? page = 1,
  })  : lastEvent = event ?? BaseSearchFromPageEvent(),
        page = page ?? 1;

  SearchPageState copyWith({
    String? searchText,
    AbstractFilms? films,
    bool? isLoading,
    bool? showShimmer,
    SearchFromPageEvent? event,
    int? page,
  }) =>
      SearchPageState(
        films: films ?? this.films,
        searchText: searchText ?? this.searchText,
        isLoading: isLoading ?? this.isLoading,
        showShimmer: showShimmer ?? this.showShimmer,
        page: page ?? this.page,
        event: event ?? lastEvent,
      );

  @override
  List<Object> get props => [
        page,
        searchText,
        isLoading,
        showShimmer,
        films,
        lastEvent,
      ];
}
