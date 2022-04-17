import 'package:collection/collection.dart';
import 'package:films_hub/app/models/filters/films_filter.dart';
import 'package:films_hub/app/models/filters/function_filter.dart';
import 'package:films_hub/app/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/repositories/films/fake_films_repository.dart';
import 'package:test/test.dart';

void main() async {
  group('Filters', () {
    test('.apply() noFiltered', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var noFilteredFilter = FilmsFilter(FunctionFilter.noFiltered());
      var sourceFilms = await filmsRepository.films().toList();
      var filteredFilms =
          await noFilteredFilter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      bool expected = true;
      bool actual = eq(sourceFilms, filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Description', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.containsPattern("Danila");
      var sourceFilms = await filmsRepository.films().toList();
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Title', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.containsPattern("Брат");
      var sourceFilms = await filmsRepository.films().toList();
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0], sourceFilms[3]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() clampByVoteAverage Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.clampByVoteAverage(8.2, 10);
      var sourceFilms = await filmsRepository.films().toList();
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0],sourceFilms[2]], filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Chain Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.chain( [
        FilmsFilter.clampByVoteAverage(8.2, 10),
        FilmsFilter.containsPattern("Danila"),
      ]);
      var sourceFilms = await filmsRepository.films().toList();
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[0]], filteredFilms);

      expect(actual, expected);
    });
  });
}
