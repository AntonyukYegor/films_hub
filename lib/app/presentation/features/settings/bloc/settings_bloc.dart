import 'package:films_hub/app/blocs/locale_bloc/local_bloc.dart';
import 'package:films_hub/app/blocs/locale_bloc/local_event.dart';
import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_event.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String tagName = 'name';
  static const String tagIsEnLocale = 'isEnLocale';
  final LocaleBloc _localeBloc;

  SettingsBloc(LocaleBloc localeBloc)
      : _localeBloc = localeBloc,
        super(const SettingsState(name: '', isEnLocale: true)) {
    on<LoadNameEvent>(_onLoadName);
    on<SaveNameEvent>(_onSaveName);
    on<ClearNameEvent>(_onClearName);
    on<UpdateLocaleEvent>(_onUpdateLocale);
    on<LoadLocaleEvent>(_onLoadLocale);
  }

  void _onLoadName(LoadNameEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString(tagName);
    emit(state.copyWith(name: name));
  }

  void _onSaveName(SaveNameEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tagName, event.name);
    emit(state.copyWith(name: event.name));
  }

  void _onClearName(ClearNameEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tagName);
    emit(state.copyWith(name: ''));
  }

  void _onUpdateLocale(
      UpdateLocaleEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(tagIsEnLocale, event.value);
    emit(state.copyWith(isEnLocale: event.value));
    _localeBloc.add(ChangeLocaleEvent(
        !event.value
            ? availableLocales[ruLocale]!
            : availableLocales[enLocale]!));
  }

  void init() {
    add(LoadLocaleEvent());
  }

  void _onLoadLocale(LoadLocaleEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    var isEnLocale = prefs.getBool(tagIsEnLocale) ?? false;
    emit(state.copyWith(isEnLocale: isEnLocale));
    _localeBloc.add(ChangeLocaleEvent(
        !isEnLocale
            ? availableLocales[ruLocale]!
            : availableLocales[enLocale]!));
  }
}
