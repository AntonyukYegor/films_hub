import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadNameEvent extends SettingsEvent {}

class SaveNameEvent extends SettingsEvent {
  final String name;

  const SaveNameEvent({required this.name});

  @override
  List<Object> get props => [name];
}

class ClearNameEvent extends SettingsEvent {}
