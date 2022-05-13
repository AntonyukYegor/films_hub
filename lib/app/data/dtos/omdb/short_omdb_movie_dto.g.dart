// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_omdb_movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortOMDBMovieDTO _$ShortOMDBMovieDTOFromJson(Map<String, dynamic> json) =>
    ShortOMDBMovieDTO(
      title: json['Title'] as String,
      year: json['Year'] as String,
      imdbID: json['imdbID'] as String,
      poster: json['Poster'] as String,
    );

Map<String, dynamic> _$ShortOMDBMovieDTOToJson(ShortOMDBMovieDTO instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Poster': instance.poster,
    };
