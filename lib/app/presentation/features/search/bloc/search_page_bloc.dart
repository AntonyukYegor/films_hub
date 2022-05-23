import 'package:films_hub/app/blocs/search_backup_bloc/search_backup_bloc.dart';
import 'package:films_hub/app/blocs/search_backup_bloc/search_backup_event.dart';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_event.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageBloc extends Bloc<SearchFromPageEvent, SearchPageState> {
  final AbstractFilmsRepository _repository;
  final FilteringPageBloc _filteringPageBloc;
  final SearchBackupBloc _searchBackupBloc;

  SearchPageBloc(
      {required AbstractFilmsRepository repository,
      required FilteringPageBloc filteringPageBloc,
      required SearchBackupBloc searchBackupBloc})
      : _repository = repository,
        _filteringPageBloc = filteringPageBloc,
        _searchBackupBloc = searchBackupBloc,
        super(searchBackupBloc.state.searchState) {
    on<SearchPageChangedEvent>(_onSearchChanged);
    on<FetchDataFromPageEvent>(_onDataFetched);
    on<ReloadDataFromPageEvent>(_onReloadData);
  }

  void init() {
    add(ReloadDataFromPageEvent());
  }

  void _onSearchChanged(
      SearchPageChangedEvent event, Emitter<SearchPageState> emit) async {
    if (state.searchText != event.search) {
      emit(state.copyWith(
        event: event,
        searchText: event.search,
        isLoading: true,
        films: Films(0, []),
      ));
      _searchBackupBloc.add(SearchBackupEvent(searchState: state));
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
            _searchBackupBloc.add(SearchBackupEvent(searchState: state));
            _filteringPageBloc.add(LoadFilterDataEvent(source: value));
          }
        },
      );
    }
  }

  void _onDataFetched(
      FetchDataFromPageEvent event, Emitter<SearchPageState> emit) async {
    if (state.isLoading == false && state.page <= state.films.pagesCount) {
      int nextPage = state.page + 1;

      emit(state.copyWith(event: event, isLoading: true));
      _searchBackupBloc.add(SearchBackupEvent(searchState: state));

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
            _searchBackupBloc.add(SearchBackupEvent(searchState: state));
            _filteringPageBloc
                .add(FetchFilterDataEvent(source: Films(0, value.films)));
          }
        },
      );
    }
  }

  void _onReloadData(
      ReloadDataFromPageEvent event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(
      event: event,
      isLoading: true,
      showShimmer: false,
      films: Films(0, []),
    ));
    _searchBackupBloc.add(SearchBackupEvent(searchState: state));
    _filteringPageBloc.add(LoadFilterDataEvent(source: Films(0, [])));
    var data = await _repository.filmsAsync(searchQuery: state.searchText);

    if (state.lastEvent == event) {
      emit(
        state.copyWith(films: data, isLoading: false, showShimmer: false),
      );
      _searchBackupBloc.add(SearchBackupEvent(searchState: state));
      _filteringPageBloc.add(LoadFilterDataEvent(source: data));
    }
  }
}
