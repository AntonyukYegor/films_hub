import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/movie_list_card.dart';
import 'package:flutter/material.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
    required List<AbstractFilm> films,
  })  : _films = films,
        super(key: key);

  final List<AbstractFilm> _films;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          var film = _films[index % _films.length];
          var cardModel = MovieCardModel.fromFilmModel(film);
          return MovieListCard(
            cardModel: cardModel,
          );
        },
        childCount: _films.length,
      ),
    );
  }
}
