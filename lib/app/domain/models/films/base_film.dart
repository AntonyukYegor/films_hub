import 'dart:ui';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';

class BaseFilm extends AbstractFilm {
  final String _id;
  final String _title;
  final String _poster;
  final double _voteAverage;
  final String _releaseDate;
  final String _description;
  final String _language;
  final String _posterLowResolution;

  const BaseFilm(
    this._id,
    this._title,
    this._poster,
    this._voteAverage,
    this._releaseDate,
    this._description,
    this._language,
    this._posterLowResolution,
  );

  @override
  String get description => _description;

  @override
  String get id => _id;

  @override
  String get language => _language;

  @override
  String get poster => _poster;

  @override
  String get posterLowResolution => _posterLowResolution;

  @override
  String get releaseDate => _releaseDate;

  @override
  String get title => _title;

  @override
  double get voteAverage => _voteAverage;

  @override
  operator ==(other) =>
      other is BaseFilm &&
      other.id == id &&
      other.description == description &&
      other.poster == poster &&
      other.poster == poster &&
      other.releaseDate == releaseDate &&
      other.title == title &&
      other.voteAverage == voteAverage &&
      other.language == language;

  @override
  int get hashCode => hashValues(
        id,
        description,
        poster,
        releaseDate,
        title,
        voteAverage,
        language,
      );
}
