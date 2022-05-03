import 'package:films_hub/app/domain/models/languages/string_to_language.dart';

abstract class AbstractFilm with StringToLanguage {
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
