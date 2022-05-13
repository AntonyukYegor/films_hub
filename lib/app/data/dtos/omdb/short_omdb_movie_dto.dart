import 'package:json_annotation/json_annotation.dart';

part 'short_omdb_movie_dto.g.dart';

@JsonSerializable()
class ShortOMDBMovieDTO {
  ShortOMDBMovieDTO({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.poster,
  });

  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Year')
  final String year;

  @JsonKey(name: 'imdbID')
  final String imdbID;

  @JsonKey(name: 'Poster')
  final String poster;

  factory ShortOMDBMovieDTO.fromJson(Map<String, dynamic> json) =>
      _$ShortOMDBMovieDTOFromJson(json);
}
