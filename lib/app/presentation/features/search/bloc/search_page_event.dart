import 'package:equatable/equatable.dart';

abstract class SearchPageEvent extends Equatable {
  DateTime get eventDate;

  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class TimedSearchPageEvent extends SearchPageEvent {
  @override
  DateTime get eventDate => _dateTime;

  final DateTime _dateTime;

  const TimedSearchPageEvent({required DateTime eventDate})
      : _dateTime = eventDate;

  @override
  List<Object> get props => [_dateTime];
}

class BaseSearchPageEvent extends TimedSearchPageEvent {
  BaseSearchPageEvent() : super(eventDate: DateTime.now());
}

class SearchChangedEvent extends BaseSearchPageEvent {
  final String search;

  SearchChangedEvent({required this.search});

  @override
  List<Object> get props => [...super.props, search];
}

class FetchDataEvent extends BaseSearchPageEvent {}

class ReloadDataEvent extends BaseSearchPageEvent {}
