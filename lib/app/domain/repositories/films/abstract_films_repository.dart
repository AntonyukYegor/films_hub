import 'package:films_hub/app/domain/models/films/abstract_film.dart';

abstract class AbstractFilmsRepository {
  Stream<AbstractFilm> filmsAsStream({String searchQuery = "",int page = 1, void Function(String errorMessage)? errorCallback});

  Future<List<AbstractFilm>> filmsAsync({String searchQuery = "",int page = 1, void Function(String errorMessage)? errorCallback});
}
