import 'package:json_annotation/json_annotation.dart';
part 'movie_details_omdb_dto.g.dart';


@JsonSerializable()
class MovieDetailsOMDBDTO {
  MovieDetailsOMDBDTO({
    required this.id,
    required this.title,
    required this.released,
    required this.description,
    required this.language,
    required this.poster,
    required this.imdbRating,
    required this.response,
  });

  @JsonKey(name: 'imdbID', defaultValue: '')
  final String id;

  @JsonKey(name: 'Title', defaultValue: '')
  final String title;

  @JsonKey(name: 'Released', defaultValue: '')
  final String released;

  @JsonKey(name: 'Plot', defaultValue: '')
  final String description;

  @JsonKey(name: 'Language', defaultValue: '')
  final String language;

  @JsonKey(name: 'Poster', defaultValue: '')
  final String poster;

  @JsonKey(name: 'imdbRating', defaultValue: '')
  final String imdbRating;

  @JsonKey(name: 'Response', defaultValue: 'False')
  final String response;

  factory MovieDetailsOMDBDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsOMDBDTOFromJson(json);
}
