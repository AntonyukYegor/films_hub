import 'package:films_hub/app/domain/models/films/abstract_film.dart';

abstract class AbstractFavouritesFilmsRepository {

  Future<void> deleteFavourite(AbstractFilm film);

  Future<void> deleteFavouriteById(String id);

  Future<void> insertFavourite(AbstractFilm film);

  bool checkForFavouriteById(String id);

  bool checkForFavourite(AbstractFilm film);

  Stream<List<AbstractFilm>> onChangedFavourites();

  Future<List<AbstractFilm>> onGetAllFavourites();
}