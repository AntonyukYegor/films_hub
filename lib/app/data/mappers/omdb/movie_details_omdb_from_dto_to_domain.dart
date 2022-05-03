import 'package:films_hub/app/data/dtos/omdb/movie_details_omdb_dto.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/base_film.dart';

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
