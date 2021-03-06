import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class UpdateLocaleEvent extends SettingsEvent {
  final bool value;

  const UpdateLocaleEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class LoadSettingsEvent extends SettingsEvent {}

class ChangeThemeModeEvent extends SettingsEvent {
  final ThemeMode mode;

  const ChangeThemeModeEvent(this.mode);

  @override
  List<Object> get props => [mode];
}