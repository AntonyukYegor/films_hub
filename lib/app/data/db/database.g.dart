// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MovieTableData extends DataClass implements Insertable<MovieTableData> {
  final String id;
  final String title;
  final String poster;
  final String posterLowResolution;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;
  MovieTableData(
      {required this.id,
      required this.title,
      required this.poster,
      required this.posterLowResolution,
      required this.voteAverage,
      required this.releaseDate,
      required this.description,
      required this.language});
  factory MovieTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      poster: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster'])!,
      posterLowResolution: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}poster_low_resolution'])!,
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average'])!,
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['poster'] = Variable<String>(poster);
    map['poster_low_resolution'] = Variable<String>(posterLowResolution);
    map['vote_average'] = Variable<double>(voteAverage);
    map['release_date'] = Variable<String>(releaseDate);
    map['description'] = Variable<String>(description);
    map['language'] = Variable<String>(language);
    return map;
  }

  MovieTableCompanion toCompanion(bool nullToAbsent) {
    return MovieTableCompanion(
      id: Value(id),
      title: Value(title),
      poster: Value(poster),
      posterLowResolution: Value(posterLowResolution),
      voteAverage: Value(voteAverage),
      releaseDate: Value(releaseDate),
      description: Value(description),
      language: Value(language),
    );
  }

  factory MovieTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      poster: serializer.fromJson<String>(json['poster']),
      posterLowResolution:
          serializer.fromJson<String>(json['posterLowResolution']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      description: serializer.fromJson<String>(json['description']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'poster': serializer.toJson<String>(poster),
      'posterLowResolution': serializer.toJson<String>(posterLowResolution),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'description': serializer.toJson<String>(description),
      'language': serializer.toJson<String>(language),
    };
  }

  MovieTableData copyWith(
          {String? id,
          String? title,
          String? poster,
          String? posterLowResolution,
          double? voteAverage,
          String? releaseDate,
          String? description,
          String? language}) =>
      MovieTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        poster: poster ?? this.poster,
        posterLowResolution: posterLowResolution ?? this.posterLowResolution,
        voteAverage: voteAverage ?? this.voteAverage,
        releaseDate: releaseDate ?? this.releaseDate,
        description: description ?? this.description,
        language: language ?? this.language,
      );
  @override
  String toString() {
    return (StringBuffer('MovieTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('poster: $poster, ')
          ..write('posterLowResolution: $posterLowResolution, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('description: $description, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, poster, posterLowResolution,
      voteAverage, releaseDate, description, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.poster == this.poster &&
          other.posterLowResolution == this.posterLowResolution &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.description == this.description &&
          other.language == this.language);
}

class MovieTableCompanion extends UpdateCompanion<MovieTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> poster;
  final Value<String> posterLowResolution;
  final Value<double> voteAverage;
  final Value<String> releaseDate;
  final Value<String> description;
  final Value<String> language;
  const MovieTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.poster = const Value.absent(),
    this.posterLowResolution = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
  });
  MovieTableCompanion.insert({
    required String id,
    required String title,
    required String poster,
    required String posterLowResolution,
    required double voteAverage,
    required String releaseDate,
    required String description,
    required String language,
  })  : id = Value(id),
        title = Value(title),
        poster = Value(poster),
        posterLowResolution = Value(posterLowResolution),
        voteAverage = Value(voteAverage),
        releaseDate = Value(releaseDate),
        description = Value(description),
        language = Value(language);
  static Insertable<MovieTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? poster,
    Expression<String>? posterLowResolution,
    Expression<double>? voteAverage,
    Expression<String>? releaseDate,
    Expression<String>? description,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (poster != null) 'poster': poster,
      if (posterLowResolution != null)
        'poster_low_resolution': posterLowResolution,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
    });
  }

  MovieTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? poster,
      Value<String>? posterLowResolution,
      Value<double>? voteAverage,
      Value<String>? releaseDate,
      Value<String>? description,
      Value<String>? language}) {
    return MovieTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      poster: poster ?? this.poster,
      posterLowResolution: posterLowResolution ?? this.posterLowResolution,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      description: description ?? this.description,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (poster.present) {
      map['poster'] = Variable<String>(poster.value);
    }
    if (posterLowResolution.present) {
      map['poster_low_resolution'] =
          Variable<String>(posterLowResolution.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('poster: $poster, ')
          ..write('posterLowResolution: $posterLowResolution, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('description: $description, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $MovieTableTable extends MovieTable
    with TableInfo<$MovieTableTable, MovieTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _posterMeta = const VerificationMeta('poster');
  @override
  late final GeneratedColumn<String?> poster = GeneratedColumn<String?>(
      'poster', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _posterLowResolutionMeta =
      const VerificationMeta('posterLowResolution');
  @override
  late final GeneratedColumn<String?> posterLowResolution =
      GeneratedColumn<String?>('poster_low_resolution', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedColumn<String?> language = GeneratedColumn<String?>(
      'language', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        poster,
        posterLowResolution,
        voteAverage,
        releaseDate,
        description,
        language
      ];
  @override
  String get aliasedName => _alias ?? 'movie_table';
  @override
  String get actualTableName => 'movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovieTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster')) {
      context.handle(_posterMeta,
          poster.isAcceptableOrUnknown(data['poster']!, _posterMeta));
    } else if (isInserting) {
      context.missing(_posterMeta);
    }
    if (data.containsKey('poster_low_resolution')) {
      context.handle(
          _posterLowResolutionMeta,
          posterLowResolution.isAcceptableOrUnknown(
              data['poster_low_resolution']!, _posterLowResolutionMeta));
    } else if (isInserting) {
      context.missing(_posterLowResolutionMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieTableTable createAlias(String alias) {
    return $MovieTableTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MovieTableTable movieTable = $MovieTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieTable];
}
