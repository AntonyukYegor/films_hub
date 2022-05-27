import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class ChangedFavourite extends FavouritesEvent {
  final MovieCardModel model;

  const ChangedFavourite({required this.model});
}

class ChangedFavourites extends FavouritesEvent {
  final List<AbstractFilm> models;

  const ChangedFavourites({required this.models});
}
