import 'package:films_hub/app/domain/models/languages/mixins/language_from_string.dart';

abstract class AbstractFilm with LanguageFromString {
  const AbstractFilm();

  String get id;

  String get title;

  String get poster;

  String get posterLowResolution;

  double get voteAverage;

  String get releaseDate;

  String get description;

  @override
  String get language;
}
