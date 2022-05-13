// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_by_title_response_omdb_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchByTitleResponseOMDBDTO _$SearchByTitleResponseOMDBDTOFromJson(
        Map<String, dynamic> json) =>
    SearchByTitleResponseOMDBDTO(
      search: (json['Search'] as List<dynamic>?)
              ?.map(
                  (e) => ShortOMDBMovieDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalResults: json['totalResults'] as String? ?? '-1',
      response: json['Response'] as String? ?? 'False',
      error: json['Error'] as String? ?? '',
    );

Map<String, dynamic> _$SearchByTitleResponseOMDBDTOToJson(
        SearchByTitleResponseOMDBDTO instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'totalResults': instance.totalResults,
      'Response': instance.response,
      'Error': instance.error,
    };
