import 'package:films_hub/app/presentation/features/settings/bloc/settings_event.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String tagName = 'name';

  SettingsBloc() : super(const SettingsState(name: '', isEnLocale: true)) {
    on<LoadNameEvent>(_onLoadName);
    on<SaveNameEvent>(_onSaveName);
    on<ClearNameEvent>(_onClearName);
    on<UpdateLocaleEvent>(_onUpdateLocale);
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

  void _onUpdateLocale(UpdateLocaleEvent event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isEnLocale: event.value));
  }
}
