import 'package:films_hub/app/data/db/database.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/base_film.dart';

extension DomainToMovieTableData on AbstractFilm {
  MovieTableData toDatabase() {
    return MovieTableData(
      id: id,
      title: title,
      poster: poster,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      description: description,
      posterLowResolution: posterLowResolution,
      language: language,
    );
  }
}

extension MovieTableDataToDomain on MovieTableData {
  AbstractFilm toDomain() {
    return BaseFilm(
      id,
      title,
      poster,
      voteAverage,
      releaseDate,
      description,
      language,
      posterLowResolution,
    );
  }
}