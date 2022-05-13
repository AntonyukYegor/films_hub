import 'dart:async';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteringPageBloc extends Bloc<FilteringPageEvent, FilteringPageState> {
  final AbstractFilmsRepository _repository;

  FilteringPageBloc({required AbstractFilmsRepository repository})
      : _repository = repository,
        super(FilteringPageState(
            searchText: 'Batman',
            films: Films(0, []),
            filteredFilms: Films(0, []),
            isLoading: false,
            showShimmer: false)) {
    on<SearchChangedEvent>(_onSearchChanged);
    on<FetchDataEvent>(_onDataFetched);
    on<ReloadDataEvent>(_onReloadData);
    on<ApplyFilterEvent>(_onFilterApply);
  }

  void _onSearchChanged(
      SearchChangedEvent event, Emitter<FilteringPageState> emit) async {
    if (state.searchText != event.search) {
      emit(state.copyWith(
        event: event,
        searchText: event.search,
        isLoading: true,
        films: Films(0, []),
        filteredFilms: Films(0, []),
      ));
      await _repository.filmsAsync(searchQuery: state.searchText).then(
        (value) async {
          var filteredFilms = Films(value.totalCount,
              await state.currentFilter.apply(Future.value(value.films)));

          if (state.lastEvent == event) {
            emit(
              state.copyWith(
                  films: value,
                  filteredFilms: filteredFilms,
                  isLoading: false,
                  showShimmer: false),
            );
          }
        },
      );
    }
  }

  void _onDataFetched(
      FetchDataEvent event, Emitter<FilteringPageState> emit) async {
    if (state.isLoading == false && state.page <= state.films.pagesCount) {
      int nextPage = state.page + 1;
      emit(state.copyWith(event: event, isLoading: true));
      await _repository
          .filmsAsync(searchQuery: state.searchText, page: nextPage)
          .then(
        (value) async {
          var fetchedFilm =
              Films(value.totalCount, state.films.films + value.films);
          var fetchedFilteringFilms = Films(
              value.totalCount,
              state.filteredFilms.films +
                  await state.currentFilter.apply(Future.value(value.films)));

          if (state.lastEvent == event) {
            emit(state.copyWith(
                films: fetchedFilm,
                filteredFilms: fetchedFilteringFilms,
                isLoading: false,
                page: nextPage));
          }
        },
      );
    }
  }

  void _onReloadData(
      ReloadDataEvent event, Emitter<FilteringPageState> emit) async {
    emit(state.copyWith(
      event: event,
      isLoading: true,
      showShimmer: false,
      films: Films(0, []),
      filteredFilms: Films(0, []),
    ));
    await _repository
        .filmsAsync(searchQuery: state.searchText)
        .then((value) async {
      var filteredFilms =
          await state.currentFilter.apply(Future.value(value.films));
      if (state.lastEvent == event) {
        emit(
          state.copyWith(
              films: value,
              filteredFilms: Films(value.totalCount, filteredFilms),
              isLoading: false,
              showShimmer: false),
        );
      }
    });
  }

  void _onFilterApply(
      ApplyFilterEvent event, Emitter<FilteringPageState> emit) async {
    var currentTotalCount = state.films.totalCount;
    var currentFilms = state.films.films;
    emit(state.copyWith(filter: event.filter, event: event));

    await event.filter.apply(Future.value(currentFilms)).then((value) {
      if (state.lastEvent == event) {
        emit(state.copyWith(filteredFilms: Films(currentTotalCount, value)));
      }
    });
  }
}
