import 'package:films_hub/app/blocs/search_backup_bloc/search_backup_event.dart';
import 'package:films_hub/app/blocs/search_backup_bloc/search_backup_state.dart';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBackupBloc extends Bloc<SearchBackupEvent, SearchBackupState> {
  SearchBackupBloc()
      : super(
          SearchBackupState(
            searchState: SearchPageState(
              searchText: 'Batman',
              films: Films(0, []),
              isLoading: false,
              showShimmer: false,
            ),
          ),
        ) {
    on<SearchBackupEvent>(_onSearchBackup);
  }

  void _onSearchBackup(
      SearchBackupEvent event, Emitter<SearchBackupState> emit) {
    emit(state.copyWith(searchState: event.searchState));
  }
}
