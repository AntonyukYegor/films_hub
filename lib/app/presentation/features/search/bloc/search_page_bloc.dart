import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_event.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final AbstractFilmsRepository _repository;
  final FilteringPageBloc _filteringPageBloc;

  SearchPageBloc(
      {required AbstractFilmsRepository repository,
      required FilteringPageBloc filteringPageBloc})
      : _repository = repository,
        _filteringPageBloc = filteringPageBloc,
        super(SearchPageState(
            searchText: 'Batman',
            films: Films(0, []),
            isLoading: false,
            showShimmer: false)) {
    on<SearchChangedEvent>(_onSearchChanged);
    on<FetchDataEvent>(_onDataFetched);
    on<ReloadDataEvent>(_onReloadData);
  }

  void init() {
    add(ReloadDataEvent());
  }

  void _onSearchChanged(
      SearchChangedEvent event, Emitter<SearchPageState> emit) async {
    if (state.searchText != event.search) {
      emit(state.copyWith(
        event: event,
        searchText: event.search,
        isLoading: true,
        films: Films(0, []),
      ));
      await _repository.filmsAsync(searchQuery: state.searchText).then(
        (value) async {
          if (state.lastEvent == event) {
            emit(
              state.copyWith(
                films: value,
                isLoading: false,
                showShimmer: false,
              ),
            );
            _filteringPageBloc.add(LoadFilterDataEvent(source: value));
          }
        },
      );
    }
  }

  void _onDataFetched(
      FetchDataEvent event, Emitter<SearchPageState> emit) async {
    if (state.isLoading == false && state.page <= state.films.pagesCount) {
      int nextPage = state.page + 1;
      emit(state.copyWith(event: event, isLoading: true));
      await _repository
          .filmsAsync(searchQuery: state.searchText, page: nextPage)
          .then(
        (value) async {
          var fetchedFilm =
              Films(value.totalCount, state.films.films + value.films);
          if (state.lastEvent == event) {
            emit(state.copyWith(
              films: fetchedFilm,
              isLoading: false,
              page: nextPage,
            ));
            _filteringPageBloc
                .add(FetchFilterDataEvent(source: Films(0, value.films)));
          }
        },
      );
    }
  }

  void _onReloadData(
      ReloadDataEvent event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(
      event: event,
      isLoading: true,
      showShimmer: false,
      films: Films(0, []),
    ));
    _filteringPageBloc.add(LoadFilterDataEvent(source: Films(0, [])));
    var data = await _repository.filmsAsync(searchQuery: state.searchText);

    if (state.lastEvent == event) {
      emit(
        state.copyWith(films: data, isLoading: false, showShimmer: false),
      );
      _filteringPageBloc.add(LoadFilterDataEvent(source: data));
    }
  }
}
