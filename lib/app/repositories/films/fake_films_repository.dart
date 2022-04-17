import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/films/base_film.dart';
import 'package:films_hub/app/models/languages/extentions/named_language.dart';
import 'package:films_hub/app/models/languages/language.dart';
import 'package:films_hub/app/repositories/films/abstract_films_repository.dart';

class FakeFilmsRepository implements AbstractFilmsRepository {
  final List<AbstractFilm> fakeFilms = [
    BaseFilm(
      "1",
      "_title",
      "_picture",
      5,
      "2022",
      "_description",
      Language.russian.toPrettyString(),
      "_duration",
    ),
    BaseFilm(
      "2",
      "firstTitle",
      "_picture",
      9.8,
      "2022",
      "_superDescription",
      Language.french.toPrettyString(),
      "_duration",
    ),
    BaseFilm(
      "3",
      "secondTitle",
      "2022",
      1,
      "test2",
      "_superDescription",
      Language.english.toPrettyString(),
      "_duration",
    ),
    BaseFilm(
      "4",
      "thirdTitle",
      "_picture",
      3,
      "2022",
      "_description",
      Language.russian.toPrettyString(),
      "_duration",
    )
  ];

  @override
  Stream<AbstractFilm> films() async* {
    for (var film in fakeFilms) {
      yield film;
    }
  }
}
