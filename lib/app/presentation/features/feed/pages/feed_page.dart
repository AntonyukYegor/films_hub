import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/features/filtering/pages/movie_filter_container_page.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/movies_list.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/app_theme_list_movies_cards_shimmer.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage(
      {Key? key,
      required String title,
      required AbstractFilmsRepository filmsRepository})
      : _title = title,
        _filmsRepository = filmsRepository,
        super(key: key);
  final String _title;
  final AbstractFilmsRepository _filmsRepository;

  @override
  Widget build(BuildContext context) {
    return MovieFilterContainerPage(
      _filmsRepository,
      builder: (BuildContext context, List<AbstractFilm> films) =>
          MoviesList(films: films),
      title: _title,
      shimmerBuilder: (BuildContext context) =>
          const AppThemeListMoviesCardsShimmer(),
    );
  }
}
