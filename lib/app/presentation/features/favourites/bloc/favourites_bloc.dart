import 'dart:async';

import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/repositories/abstract_favourites_films_repository.dart';
import 'package:films_hub/app/presentation/common/mappers/movie_list_card_mapper.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final AbstractFavouritesFilmsRepository _repository;

  FavouritesBloc({
    required AbstractFavouritesFilmsRepository repository,
  })  : _repository = repository,
        super(const FavouritesState(films: [])) {
    on<ChangedFavourite>(_onChangedFavourite);
    on<ChangedFavourites>(_onChangedFavourites);
    _repository.onChangedFavourites().listen((event) {
      add(ChangedFavourites(models: event));
    });
  }

  FutureOr<void> _onChangedFavourite(
      ChangedFavourite event, Emitter<FavouritesState> emit) {
    final MovieCardModel targetMovie = event.model;
    final AbstractFilm targetFilm = targetMovie.toDomain();

    if (_repository.checkForFavourite(targetFilm)) {
      _repository.deleteFavourite(targetFilm);
    } else {
      _repository.insertFavourite(targetFilm);
    }
  }

  FutureOr<void> _onChangedFavourites(
      ChangedFavourites event, Emitter<FavouritesState> emit) {
    emit(state.copyWith(films: event.models));
  }
}
