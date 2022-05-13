import 'package:drift/drift.dart';
import 'package:films_hub/app/data/db/database.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/data/mappers/drift/movie_table_data_mapper.dart';

class DriftDBMoviesService {
  final Database _db = Database();

  void close() {
    _db.close();
  }

  Future<List<AbstractFilm>> getAllMoviesDB() async {
    var moviesDB = await _db.select(_db.movieTable).get();

    return moviesDB
        .map((MovieTableData movieTableData) => movieTableData.toDomain())
        .toList();
  }

  Future<void> insertMovieDB(AbstractFilm film) async {
    await _db.into(_db.movieTable).insert(
          film.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> deleteMovieDB(String id) async {
    await (_db.delete(_db.movieTable)
          ..where((movieTable) => movieTable.id.equals(id)))
        .go();
  }

  Stream<List<AbstractFilm>> onChangedMoviesDB() {
    return (_db.select(_db.movieTable))
        .map((MovieTableData movieTableData) => movieTableData.toDomain())
        .watch();
  }
}
