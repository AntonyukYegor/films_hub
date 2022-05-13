import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/languages/extensions/named_language.dart';

class MovieCardModel {
  final String title;
  final String id;
  final double voteAverage;
  final double voteAverageInPercent;
  final String language;
  final String poster;
  final String description;
  final String releaseDate;
  final String posterLowResolution;

  factory MovieCardModel.fromFilmModel(AbstractFilm film) {
    return MovieCardModel(
      film.id,
      film.title,
      film.voteAverage,
      film.voteAverage * 0.1,
      film.stringToLanguage().toShortString(),
      film.poster,
      film.description,
      film.releaseDate,
      film.posterLowResolution,
    );
  }

  const MovieCardModel(
    this.id,
    this.title,
    this.voteAverage,
    this.voteAverageInPercent,
    this.language,
    this.poster,
    this.description,
    this.releaseDate,
    this.posterLowResolution,
  );
}
