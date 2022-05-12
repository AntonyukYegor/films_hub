import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final AbstractFilmsRepository _repository;
  final FilteringPageBloc _filteringPageBloc;

  FavouritesBloc(
      {required AbstractFilmsRepository repository,
        required FilteringPageBloc filteringPageBloc})
      : _repository = repository,
        _filteringPageBloc = filteringPageBloc,
        super(FavouritesState(
          films: Films(0, []),
          isLoading: false)) {
    on<ReloadFavouritesDataEvent>(_onReloadData);
    add(ReloadFavouritesDataEvent());
  }

  void _onReloadData(
      ReloadFavouritesDataEvent event, Emitter<FavouritesState> emit) async {
    emit(state.copyWith(
      event: event,
      isLoading: true,
      films: Films(0, []),
    ));
    _filteringPageBloc.add(LoadFilterDataEvent(source: Films(0, [])));
    var data = await _repository.filmsAsync();

    emit(
      state.copyWith(films: data, isLoading: false),
    );
    _filteringPageBloc.add(LoadFilterDataEvent(source: data));
  }
}
