import 'package:films_hub/app/domain/models/languages/mixins/string_to_language.dart';

abstract class AbstractFilm with StringToLanguage {
  const AbstractFilm();

  String get id;

  String get title;

  String get poster;

  double get voteAverage;

  String get releaseDate;

  String get description;

  String get duration;

  @override
  String get language;
}
