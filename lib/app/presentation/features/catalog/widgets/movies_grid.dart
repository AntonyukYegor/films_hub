import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/catalog/widgets/movie_grid_view_card.dart';
import 'package:flutter/material.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    Key? key,
    required List<AbstractFilm> films,
  })  : _films = films,
        super(key: key);

  final List<AbstractFilm> _films;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var film = _films[index % _films.length];
          var cardModel = MovieCardModel.fromFilmModel(film);
          return MovieGridViewCard(
            cardModel: cardModel,
          );
        },
        childCount: _films.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: 2 / 2.4,
      ),
    );
  }
}
