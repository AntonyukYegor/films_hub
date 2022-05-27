import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/movies_list.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/app_theme_list_movies_cards_shimmer.dart';
import 'package:films_hub/app/presentation/features/search/pages/movie_search_container_page.dart';
import 'package:flutter/material.dart';


class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieSearchContainerPage(
      builder: (BuildContext context, List<AbstractFilm> films) =>
          MoviesList(films: films),
      title: context.locale.feed.title,
      shimmerBuilder: (BuildContext context) =>
      const AppThemeListMoviesCardsShimmer(),
    );
  }
}
