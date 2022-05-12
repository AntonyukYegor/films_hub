import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_event.dart';

class FavouritesState extends Equatable {
  final AbstractFilms films;
  final bool isLoading;

  const FavouritesState({
    required this.films,
    required this.isLoading,
  });

  FavouritesState copyWith({
    AbstractFilms? films,
    bool? isLoading,
    FavouritesEvent? event,
    int? page,
  }) =>
      FavouritesState(
        films: films ?? this.films,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [
    isLoading,
    films,
  ];
}
