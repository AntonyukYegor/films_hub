import 'package:collection/collection.dart';
import 'package:films_hub/app/models/filters/films_filter.dart';
import 'package:films_hub/app/models/filters/filters_chain_builder.dart';
import 'package:films_hub/app/models/filters/function_filter.dart';
import 'package:films_hub/app/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/repositories/films/fake_films_repository.dart';
import 'package:test/test.dart';

void main() async {
  group('Filters', () {
    test('.apply() noFiltered', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var noFilteredFilter = FilmsFilter(FunctionFilter.noFiltered());
      var sourceFilms = await filmsRepository.films().toList() ;
      var filteredFilms = await noFilteredFilter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      bool expected = true;
      bool actual = eq(sourceFilms,filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Description', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.containsPattern("_superDescription");
      var sourceFilms = await filmsRepository.films().toList() ;
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[1],sourceFilms[2]],filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Filter By Pattern In Title', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.containsPattern("Title");
      var sourceFilms = await filmsRepository.films().toList() ;
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[1],sourceFilms[2],sourceFilms[3]],filteredFilms);

      expect(actual, expected);
    });


    test('.apply() Chain Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.chain(FiltersChainBuilder(), [FilmsFilter.containsPattern("_superDescription"), FilmsFilter.clampByVoteAverage(9, 10)]) ;
      var sourceFilms = await filmsRepository.films().toList() ;
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[1]],filteredFilms);

      expect(actual, expected);
    });

    test('.apply() Chain Filter', () async {
      AbstractFilmsRepository filmsRepository = FakeFilmsRepository();
      var filter = FilmsFilter.chain(FiltersChainBuilder(), [FilmsFilter.containsPattern("_superDescription"), FilmsFilter.clampByVoteAverage(9, 10)]);
      var sourceFilms = await filmsRepository.films().toList() ;
      var filteredFilms = await filter.apply(filmsRepository.films()).toList();

      Function eq = const ListEquality().equals;

      var expected = true;
      var actual = eq([sourceFilms[1]],filteredFilms);

      expect(actual, expected);
    });
  });
}