import 'package:collection/collection.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_clamp_by_vote_average_condition.dart';
import 'package:films_hub/app/domain/models/filters/conditions/films/film_contains_pattern_condition.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/domain/models/filters/films/film_list_filter.dart';
import 'package:films_hub/app/domain/models/filters/films/film_stream_filter.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/data/repositories/films/fake_films_repository.dart';
import 'package:test/test.dart';

void main() async {
  group('Filters with source as Stream', () {
    test('.apply() noFiltered', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var noFilteredFilter = FilmStreamFilter.empty(); // FilmsFilter.empty();
      var sourceFilms = await filmsRepository.filmsAsStream().toList();
      var filteredFilms = await noFilteredFilter
          .apply(filmsRepository.filmsAsStream())
          .toList();

      Function eq = const ListEquality().equals;

      bool expected = true;
      bool actual = eq(sourceFilms, filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Description', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter =
          FilmStreamFilter.condition(FilmContainsPatternCondition("Danila"));
      var sourceFilms = await filmsRepository.filmsAsStream().toList();
      var filteredFilms =
          await filter.apply(filmsRepository.filmsAsStream()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Title', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter =
          FilmStreamFilter.condition(FilmContainsPatternCondition("Брат"));
      var sourceFilms = await filmsRepository.filmsAsStream().toList();
      var filteredFilms =
          await filter.apply(filmsRepository.filmsAsStream()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() clampByVoteAverage Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmStreamFilter.condition(FilmClampByVoteAverageCondition(
          8.2, 10)); // FilmsFilter.clampByVoteAverage;
      var sourceFilms = await filmsRepository.filmsAsStream().toList();
      var filteredFilms =
          await filter.apply(filmsRepository.filmsAsStream()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[2]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Chain Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmStreamFilter.everyConditions([
        FilmClampByVoteAverageCondition(8.2, 10),
        FilmContainsPatternCondition("Danila")
      ]);

      var sourceFilms = await filmsRepository.filmsAsStream().toList();
      var filteredFilms =
          await filter.apply(filmsRepository.filmsAsStream()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0]], filteredFilms);

      expect(actual, expected);
    });
  });

  group('Filters with source as List async', () {
    test('.apply() noFiltered', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var noFilteredFilter = FilmFutureListFilter.empty();
      var sourceFilms = await filmsRepository.filmsAsync();
      var filteredFilms =
          await noFilteredFilter.apply(filmsRepository.filmsAsync());

      Function eq = const ListEquality().equals;

      bool expected = true;
      bool actual = eq(sourceFilms, filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Description', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmFutureListFilter.condition(FilmContainsPatternCondition(
          "Danila")); //FilmsFilter.containsPattern();
      var sourceFilms = await filmsRepository.filmsAsync();
      var filteredFilms = await filter.apply(filmsRepository.filmsAsync());

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Title', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter =
          FilmFutureListFilter.condition(FilmContainsPatternCondition("Брат"));
      var sourceFilms = await filmsRepository.filmsAsync();
      var filteredFilms = await filter.apply(filmsRepository.filmsAsync());

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() clampByVoteAverage Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmFutureListFilter.condition(
          FilmClampByVoteAverageCondition(8.2, 10));
      var sourceFilms = await filmsRepository.filmsAsync();
      var filteredFilms = await filter.apply(filmsRepository.filmsAsync());

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[2]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Chain Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmFutureListFilter.everyConditions([
        FilmClampByVoteAverageCondition(8.2, 10),
        FilmContainsPatternCondition("Danila")
      ]);
      var sourceFilms = await filmsRepository.filmsAsync();
      var filteredFilms = await filter.apply(filmsRepository.filmsAsync());

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0]], filteredFilms);

      expect(actual, expected);
    });
  });

  group('Filters with source as List sync', () {
    test('.apply() noFiltered', () {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var noFilteredFilter = FilmListFilter.empty();
      var sourceFilms = filmsRepository.films();
      var filteredFilms = noFilteredFilter.apply(sourceFilms);

      Function eq = const ListEquality().equals;

      bool expected = true;
      bool actual = eq(sourceFilms, filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Description', () {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter =
          FilmListFilter.condition(FilmContainsPatternCondition("Danila"));
      var sourceFilms = filmsRepository.films();
      var filteredFilms = filter.apply(sourceFilms);

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Title', () {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmListFilter.condition(
          FilmContainsPatternCondition("Брат")); //.containsPattern();
      var sourceFilms = filmsRepository.films();
      var filteredFilms = filter.apply(sourceFilms);

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() clampByVoteAverage Filter', () {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter =
          FilmListFilter.condition(FilmClampByVoteAverageCondition(8.2, 10));
      var sourceFilms = filmsRepository.films();
      var filteredFilms = filter.apply(sourceFilms);

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[2]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Chain Filter', () {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmListFilter.everyConditions([
        FilmClampByVoteAverageCondition(8.2, 10),
        FilmContainsPatternCondition("Danila"),
      ]);
      var sourceFilms = filmsRepository.films();
      var filteredFilms = filter.apply(sourceFilms);

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0]], filteredFilms);

      expect(actual, expected);
    });
  });
}
