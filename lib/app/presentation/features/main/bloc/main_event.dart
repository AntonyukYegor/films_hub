import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class SelectedIndexChangedEvent extends MainEvent {
  final int index;

  const SelectedIndexChangedEvent({required this.index});

  @override
  List<Object> get props => [index];
}
