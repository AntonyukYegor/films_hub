import 'package:films_hub/app/data/dtos/omdb/short_omdb_movie_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_by_title_response_omdb_dto.g.dart';


@JsonSerializable()
class SearchByTitleResponseOMDBDTO {
  SearchByTitleResponseOMDBDTO({
    required this.search,
    required this.totalResults,
    required this.response,
    required this.error,
  });

  @JsonKey(name: 'Search', defaultValue: [])
  final List<ShortOMDBMovieDTO> search;

  @JsonKey(name: 'totalResults', defaultValue: '-1')
  final String totalResults;

  @JsonKey(name: 'Response', defaultValue: 'False')
  final String response;

  @JsonKey(name: 'Error', defaultValue: '')
  final String error;

  factory SearchByTitleResponseOMDBDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchByTitleResponseOMDBDTOFromJson(json);
}