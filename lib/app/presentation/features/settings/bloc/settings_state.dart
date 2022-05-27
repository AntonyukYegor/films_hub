import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  final String name;

  final bool isEnLocale;
  final ThemeMode themeMode;

  const SettingsState(
      {required this.name, required this.isEnLocale, required this.themeMode});

  SettingsState copyWith(
          {String? name, bool? isEnLocale, ThemeMode? themeMode}) =>
      SettingsState(
        name: name ?? this.name,
        isEnLocale: isEnLocale ?? this.isEnLocale,
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  List<Object> get props => [name, isEnLocale, themeMode];
}
