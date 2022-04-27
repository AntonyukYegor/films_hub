import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/languages/extensions/named_language.dart';

class MovieListCardModel {
  final String title;
  final double voteAverage;
  final double voteAverageInPercent;
  final String language;
  final String poster;
  final String description;
  final String releaseDate;

  factory MovieListCardModel.fromFilmModel(AbstractFilm film) {
    return MovieListCardModel(
      film.title,
      film.voteAverage,
      film.voteAverage * 0.1,
      film.stringToLanguage().toShortString(),
      film.poster,
      film.description,
      film.releaseDate,
    );
  }

  const MovieListCardModel(
    this.title,
    this.voteAverage,
    this.voteAverageInPercent,
    this.language,
    this.poster,
    this.description,
    this.releaseDate,
  );
}
