// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_omdb_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsOMDBDTO _$MovieDetailsOMDBDTOFromJson(Map<String, dynamic> json) =>
    MovieDetailsOMDBDTO(
      id: json['imdbID'] as String? ?? '',
      title: json['Title'] as String? ?? '',
      released: json['Released'] as String? ?? '',
      description: json['Plot'] as String? ?? '',
      language: json['Language'] as String? ?? '',
      poster: json['Poster'] as String? ?? '',
      imdbRating: json['imdbRating'] as String? ?? '',
      response: json['Response'] as String? ?? 'False',
    );

Map<String, dynamic> _$MovieDetailsOMDBDTOToJson(
        MovieDetailsOMDBDTO instance) =>
    <String, dynamic>{
      'imdbID': instance.id,
      'Title': instance.title,
      'Released': instance.released,
      'Plot': instance.description,
      'Language': instance.language,
      'Poster': instance.poster,
      'imdbRating': instance.imdbRating,
      'Response': instance.response,
    };
