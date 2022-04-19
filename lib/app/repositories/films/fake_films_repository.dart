import 'dart:io';

import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/films/base_film.dart';
import 'package:films_hub/app/models/languages/extensions/named_language.dart';
import 'package:films_hub/app/models/languages/language.dart';
import 'package:films_hub/app/repositories/films/abstract_films_repository.dart';

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
      "1.40",
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
      "2.49",
    ),
    BaseFilm(
      "4",
      "Брат 2",
      "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/649da998-2f4f-4fcf-87e0-de52917b3812/1920x",
      8.1,
      "2000",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "2.7",
    )
  ];

  @override
  Stream<AbstractFilm> filmsAsStream() async* {
    for (var film in _fakeFilms) {
      await Future.delayed(_duration);
      yield film;
    }
  }

  @override
  Future<List<AbstractFilm>> filmsAsync() async {
    return Future.value(filmsAsStream().toList());
  }

  @override
  List<AbstractFilm> films() {
    sleep(_duration * _fakeFilms.length);
    return _fakeFilms;
  }
}
