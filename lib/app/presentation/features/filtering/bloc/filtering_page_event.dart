import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';

abstract class FilteringPageEvent extends Equatable {
  const FilteringPageEvent();

  @override
  List<Object> get props => [];
}

class ApplyFilterEvent extends FilteringPageEvent {
  final AbstractFilter<Future<List<AbstractFilm>>> filter;

  const ApplyFilterEvent({required this.filter});

  @override
  List<Object> get props => [filter];
}

class LoadFilterDataEvent extends FilteringPageEvent {
  final AbstractFilms source;

  const LoadFilterDataEvent({required this.source});

  @override
  List<Object> get props => [source];
}

class FetchFilterDataEvent extends FilteringPageEvent {
  final AbstractFilms source;

  const FetchFilterDataEvent({required this.source});

  @override
  List<Object> get props => [source];
}