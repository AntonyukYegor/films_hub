import 'package:equatable/equatable.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';

abstract class FilteringPageEvent extends Equatable {
  DateTime get eventDate;

  const FilteringPageEvent();

  @override
  List<Object> get props => [];
}

class TimedFilteringPageEvent extends FilteringPageEvent {
  @override
  DateTime get eventDate => _dateTime;

  final DateTime _dateTime;

  const TimedFilteringPageEvent({required DateTime eventDate})
      : _dateTime = eventDate;

  @override
  List<Object> get props => [_dateTime];
}

class BaseFilteringPageEvent extends TimedFilteringPageEvent {
  BaseFilteringPageEvent() : super(eventDate: DateTime.now());
}

class SearchChangedEvent extends BaseFilteringPageEvent {
  final String search;

  SearchChangedEvent({required this.search});

  @override
  List<Object> get props => [...super.props, search];
}

class ApplyFilterEvent extends BaseFilteringPageEvent {
  final AbstractFilter<Future<List<AbstractFilm>>> filter;

  ApplyFilterEvent({required this.filter});

  @override
  List<Object> get props => [...super.props, filter];
}

class FetchDataEvent extends BaseFilteringPageEvent {}

class ReloadDataEvent extends BaseFilteringPageEvent {}
