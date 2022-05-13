import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/base_film.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';

extension DomainToMovieCardModel on AbstractFilm {
  MovieCardModel toPresentation() {
    return MovieCardModel.fromFilmModel(this);
  }
}

extension MovieCardModelToDomain on MovieCardModel {
  AbstractFilm toDomain() {
    return BaseFilm(
      id,
      title,
      poster,
      voteAverage,
      releaseDate,
      description,
      language,
      posterLowResolution,
    );
  }
}
