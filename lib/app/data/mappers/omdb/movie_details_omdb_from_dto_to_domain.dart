import 'package:films_hub/app/data/dtos/omdb/movie_details_omdb_dto.dart';
import 'package:films_hub/app/data/dtos/omdb/movies_with_details_omdb_to_response.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/films/base_film.dart';
import 'package:films_hub/app/domain/models/films/films.dart';

extension MovieDetailsOMDBDFromDTOToDomain on MovieDetailsOMDBDTO {
  AbstractFilm toDomain() {
    return BaseFilm(
      id,
      title,
      poster,
      double.tryParse(imdbRating) ?? 0,
      released,
      description,
      language.split(', ').last,
      poster.replaceAll('300.jpg', '10.jpg'),
    );
  }
}

extension MoviesWithDetailsOMDBDTOResponseFromDTOToDomain
    on MoviesWithDetailsOMDBDTOResponse {
  AbstractFilms toDomain() {
    return Films(
      totalCount,
      movies.map((e) => e.toDomain()).toList(),
    );
  }
}
