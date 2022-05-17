import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/presentation/features/catalog/widgets/movies_grid.dart';
import 'package:films_hub/app/presentation/features/catalog/widgets/app_theme_grid_view_movies_cards_shimmer.dart';
import 'package:films_hub/app/presentation/features/search/pages/movie_search_container_page.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieSearchContainerPage(
      builder: (BuildContext context, List<AbstractFilm> films) =>
          MoviesGrid(films: films),
      title: context.locale.catalog.title,
      shimmerBuilder: (BuildContext context) =>
          const AppThemeGridViewMoviesCardsShimmer(),
    );
  }
}
