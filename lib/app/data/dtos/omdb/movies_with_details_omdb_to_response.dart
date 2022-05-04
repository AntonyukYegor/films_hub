import 'package:films_hub/app/data/dtos/omdb/movie_details_omdb_dto.dart';

class MoviesWithDetailsOMDBDTOResponse {
  final int totalCount;

  final List<MovieDetailsOMDBDTO> movies;

  MoviesWithDetailsOMDBDTOResponse(this.totalCount, this.movies);
}
