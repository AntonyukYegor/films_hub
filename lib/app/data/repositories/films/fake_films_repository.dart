import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/films/base_film.dart';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_contains_pattern_condition.dart';
import 'package:films_hub/app/domain/models/filters/films/film_stream_filter.dart';
import 'package:films_hub/app/domain/models/languages/extensions/named_language.dart';
import 'package:films_hub/app/domain/models/languages/language.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';

class FakeFilmsRepository implements AbstractFilmsRepository {
  final Duration _duration;

  FakeFilmsRepository() : this.delayed(const Duration());

  factory FakeFilmsRepository.delayedInSeconds(int seconds) {
    return FakeFilmsRepository.delayed(Duration(seconds: seconds));
  }

  factory FakeFilmsRepository.delayedInMilliseconds(int milliseconds) {
    return FakeFilmsRepository.delayed(Duration(milliseconds: milliseconds));
  }

  FakeFilmsRepository.delayed(this._duration);

  final List<AbstractFilm> _fakeFilms = [
    BaseFilm(
      "1",
      "Брат",
      "https://www.kino-teatr.ru/movie/posters/big/9/629.jpg",
      8.3,
      "1997",
      "Demobilizovannyy iz armii Danila Bagrov reshilsya podat'sya v Peterburg, gde uzhe neskol'ko let protsvetaet ego starshiy brat. Danila nashel brata. No vse okazalos' ne tak prosto.",
      Language.russian.toPrettyString(),
      "https://www.kino-teatr.ru/movie/posters/big/9/629.jpg",
    ),
    BaseFilm(
      "2",
      "Амели",
      "https://b1.filmpro.ru/c/20849.jpg",
      8.0,
      "2001",
      "Знаете ли вы, что все события, происходящие в нашем мире, даже самые незначительные, взаимосвязаны самым удивительным и чудесным образом?",
      Language.french.toPrettyString(),
      "2.2",
    ),
    BaseFilm(
      "3",
      "Интерстеллар",
      "https://b1.filmpro.ru/c/258954.jpg",
      8.6,
      "2014",
      "Наше время на Земле подошло к концу, команда исследователей берет на себя самую важную миссию в истории человечества; путешествуя за пределами нашей галактики, чтобы узнать есть ли у человечества будущее среди звезд.",
      Language.english.toPrettyString(),
      "https://b1.filmpro.ru/c/258954.jpg",
    ),
    BaseFilm(
      "4",
      "Брат 2",
      "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/649da998-2f4f-4fcf-87e0-de52917b3812/1920x",
      8.1,
      "2000",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/649da998-2f4f-4fcf-87e0-de52917b3812/1920x",
    )
  ];

  @override
  Stream<AbstractFilm> filmsAsStream(
      {String searchQuery = "",
      int page = 1,
      void Function(String errorMessage)? errorCallback}) async* {
    await Future.delayed(_duration);
    var filter = FilmStreamFilter.condition(
      FilmContainsPatternCondition(searchQuery),
    );
    yield* filter.apply(Stream.fromIterable(_fakeFilms));
  }

  @override
  Future<AbstractFilms> filmsAsync(
      {String searchQuery = "",
      int page = 1,
      void Function(String errorMessage)? errorCallback}) async {
    var films = await filmsAsStream(searchQuery: searchQuery).toList();
    var result = Films(films.length, films);
    return result;
  }
}
