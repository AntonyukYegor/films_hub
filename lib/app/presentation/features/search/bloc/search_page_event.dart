import 'package:equatable/equatable.dart';

abstract class SearchFromPageEvent extends Equatable {
  DateTime get eventDate;

  const SearchFromPageEvent();

  @override
  List<Object> get props => [];
}

class TimedSearchFromPageEvent extends SearchFromPageEvent {
  @override
  DateTime get eventDate => _dateTime;

  final DateTime _dateTime;

  const TimedSearchFromPageEvent({required DateTime eventDate})
      : _dateTime = eventDate;

  @override
  List<Object> get props => [_dateTime];
}

class BaseSearchFromPageEvent extends TimedSearchFromPageEvent {
  BaseSearchFromPageEvent() : super(eventDate: DateTime.now());
}

class SearchPageChangedEvent extends BaseSearchFromPageEvent {
  final String search;

  SearchPageChangedEvent({required this.search});

  @override
  List<Object> get props => [...super.props, search];
}

class FetchDataFromPageEvent extends BaseSearchFromPageEvent {}

class ReloadDataFromPageEvent extends BaseSearchFromPageEvent {}
