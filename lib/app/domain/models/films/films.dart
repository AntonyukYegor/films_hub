import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';

class Films implements AbstractFilms {
  final int _totalCount;

  final List<AbstractFilm> _films;

  Films(this._totalCount, this._films);

  @override
  List<AbstractFilm> get films => _films;

  @override
  int get totalCount => _totalCount;

  @override
  void addAll(Iterable<AbstractFilm> value) {
    _films.addAll(value);
  }

  @override
  int get pagesCount => (_totalCount/10).ceil();

  @override
  void clear() {
    _films.clear();
  }
}