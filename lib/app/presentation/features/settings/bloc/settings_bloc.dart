import 'package:films_hub/app/blocs/locale_bloc/local_bloc.dart';
import 'package:films_hub/app/blocs/locale_bloc/local_event.dart';
import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_event.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:films_hub/app/components/extensions/theme_mode_extensions.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String _tagName = 'name';
  static const String _tagIsEnLocale = 'isEnLocale';
  static const String _tagThemeMode = 'themeMode';
  final LocaleBloc _localeBloc;

  SettingsBloc(LocaleBloc localeBloc)
      : _localeBloc = localeBloc,
        super(const SettingsState(
            name: '', isEnLocale: true, themeMode: ThemeMode.dark)) {
    on<LoadNameEvent>(_onLoadName);
    on<SaveNameEvent>(_onSaveName);
    on<ClearNameEvent>(_onClearName);
    on<UpdateLocaleEvent>(_onUpdateLocale);
    on<LoadSettingsEvent>(_onLoadSettings);
    on<ChangeThemeModeEvent>(_onThemeModeChanged);
  }

  void _onLoadName(LoadNameEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString(_tagName);
    emit(state.copyWith(name: name));
  }

  void _onSaveName(SaveNameEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tagName, event.name);
    emit(state.copyWith(name: event.name));
  }

  void _onClearName(ClearNameEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tagName);
    emit(state.copyWith(name: ''));
  }

  void _onUpdateLocale(
      UpdateLocaleEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isEnLocale: event.value));
    _localeBloc.add(ChangeLocaleEvent(!event.value
        ? availableLocales[ruLocale]!
        : availableLocales[enLocale]!));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_tagIsEnLocale, event.value);
  }

  void init() {
    add(LoadSettingsEvent());
  }

  void _onLoadSettings(LoadSettingsEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    var isEnLocale = prefs.getBool(_tagIsEnLocale) ?? false;
    var currentThemeMode = prefs.getString(_tagThemeMode)?.asThemeMode() ?? ThemeMode.dark;

    emit(state.copyWith(isEnLocale: isEnLocale, themeMode: currentThemeMode));
    _localeBloc.add(ChangeLocaleEvent(!isEnLocale
        ? availableLocales[ruLocale]!
        : availableLocales[enLocale]!));
  }

  void _onThemeModeChanged(
      ChangeThemeModeEvent event, Emitter<SettingsState> emit) async {
    if (event.mode != state.themeMode) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tagThemeMode, event.mode.asString());
      emit(state.copyWith(themeMode: event.mode));
    }
  }
}
