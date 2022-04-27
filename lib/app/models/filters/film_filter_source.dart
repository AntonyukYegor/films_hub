import 'package:films_hub/app/models/filters/films/film_future_list_filter.dart';

abstract class FilmFilterSource {
  FilmFutureListFilter filter();

  void reset();
}
