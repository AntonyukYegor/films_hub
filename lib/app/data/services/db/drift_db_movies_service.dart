import 'package:drift/drift.dart';
import 'package:films_hub/app/data/db/database.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/data/mappers/drift/movie_table_data_mapper.dart';

class DriftDBMoviesService {
  final Database _db = Database();

  void close() {
    _db.close();
  }

  Future<AbstractFilms> getAllMoviesDB() async {
    // int moviesCount = await _db.moviesCount();
    var moviesDB = await _db.select(_db.movieTable).get();

    var films = moviesDB
        .map((MovieTableData movieTableData) => movieTableData.toDomain())
        .toList();

    return Films(films.length, films);
  }

  // Future<List<MovieTableData>> _limitMovieTableData(int limit, {int? offset}) {
  //   return (_db.select(_db.movieTable)..limit(limit, offset: offset)).get();
  // }

  Future<void> insertMovieDB(AbstractFilm movieCardModel) async {
    await _db.into(_db.movieTable).insert(
          movieCardModel.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> deleteMovieDB(String id) async {
    await (_db.delete(_db.movieTable)
          ..where((movieTable) => movieTable.id.equals(id)))
        .go();
  }
}
