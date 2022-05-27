import 'dart:collection';

import 'package:films_hub/app/data/services/db/drift_db_movies_service.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/repositories/abstract_favourites_films_repository.dart';

class FavouritesFilmsRepository implements AbstractFavouritesFilmsRepository {
  final DriftDBMoviesService _service = DriftDBMoviesService();
  final HashSet<String> _favouritesFilmsIds = HashSet<String>();

  FavouritesFilmsRepository() {
    _service.onChangedMoviesDB().listen(_update);
  }

  void _update(List<AbstractFilm> films) {
    _favouritesFilmsIds.clear();
    for (var film in films) {
      _favouritesFilmsIds.add(film.id);
    }
  }

  @override
  Future<void> insertFavourite(AbstractFilm film) async {
    await _service.insertMovieDB(film);
  }

  @override
  bool checkForFavourite(AbstractFilm film) {
    return checkForFavouriteById(film.id);
  }

  @override
  bool checkForFavouriteById(String id) {
    return _favouritesFilmsIds.contains(id);
  }

  @override
  Future<void> deleteFavourite(AbstractFilm film) async {
    await deleteFavouriteById(film.id);
  }

  @override
  Future<void> deleteFavouriteById(String id) async {
    await _service.deleteMovieDB(id);
  }

  @override
  Stream<List<AbstractFilm>> onChangedFavourites() async* {
    yield* _service.onChangedMoviesDB();
  }

  @override
  Future<List<AbstractFilm>> onGetAllFavourites() async{
    return _service.getAllMoviesDB();
  }
}
