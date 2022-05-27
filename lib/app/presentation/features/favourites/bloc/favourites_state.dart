import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';

class FavouritesState extends Equatable {
  final List<AbstractFilm> films;

  const FavouritesState({
    required this.films,
  });

  FavouritesState copyWith({
    List<AbstractFilm>? films,
  }) =>
      FavouritesState(
        films: films ?? this.films,
      );

  @override
  List<Object> get props => [
    films,
  ];
}
