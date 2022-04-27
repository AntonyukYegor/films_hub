import 'dart:io';

import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/films/base_film.dart';
import 'package:films_hub/app/models/languages/extensions/named_language.dart';
import 'package:films_hub/app/models/languages/language.dart';
import 'package:films_hub/app/repositories/films/abstract_films_repository.dart';

class ExtendedFakeFilmsRepository implements AbstractFilmsRepository {
  final Duration _duration;

  ExtendedFakeFilmsRepository() : this.delayed(const Duration());

  factory ExtendedFakeFilmsRepository.delayedInSeconds(int seconds) {
    return ExtendedFakeFilmsRepository.delayed(Duration(seconds: seconds));
  }

  factory ExtendedFakeFilmsRepository.delayedInMilliseconds(int milliseconds) {
    return ExtendedFakeFilmsRepository.delayed(Duration(milliseconds: milliseconds));
  }

  ExtendedFakeFilmsRepository.delayed(this._duration);

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
    ),
    BaseFilm(
      "5",
      "Бэтмен",
      "https://upload.wikimedia.org/wikipedia/ru/archive/b/b2/20220228183209%21The_Batman_Poster.jpg",
      7.9,
      "2022",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "2.7",
    ),
    BaseFilm(
      "4",
      "Анчартед: На картах не значится",
      "https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/3ddc0946-5e53-4f7a-b355-cd42c2280f9e/300x450",
      7,
      "2022",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "2.7",
    ),
    BaseFilm(
      "4",
      "Человек-паук: Нет пути домой",
      "https://avatars.mds.yandex.net/get-kinopoisk-image/6201401/731c4031-7389-44f4-8c15-f9f4e3b0ed90/300x450",
      7.8,
      "2022",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "2.7",
    ),
    BaseFilm(
      "4",
      "Душа",
      "https://www.kinonews.ru/insimgs/2020/newsimg/newsimg96242.jpg",
      8.4,
      "2021",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "2.7",
    ),
    BaseFilm(
      "4",
      "Райя и последний дракон",
      "https://upload.wikimedia.org/wikipedia/ru/1/18/Raya_and_the_Last_Dragon.jpeg",
      6.1,
      "2000",
      "Uchastvuya v programme na televidenii, Danila Bagrov vstrechaet svoikh druzey po Chechne. Odnogo iz nikh vnezapno ubivayut. Danila znaet, chto u togo byli nepriyatnosti iz-za brata-khokkeista v Amerike. Danila dolzhen razobrat'sya.",
      Language.russian.toPrettyString(),
      "2.7",
    ),
    BaseFilm(
      "4",
      "Дракон желаний",
      "https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/201013b0-f247-401c-ba80-70db6d2dcc06/300x450",
      9.5,
      "2021",
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
