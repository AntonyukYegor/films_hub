import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';

abstract class FavouritesEvent extends Equatable {

  const FavouritesEvent();

  @override
  List<Object> get props => [];
}


class ReloadFavouritesDataEvent extends FavouritesEvent {}

class ChangedFavourites extends FavouritesEvent {
  final AbstractFilms model;

  const ChangedFavourites({required this.model});

}