import 'package:films_hub/app/blocs/locale_bloc/local_event.dart';
import 'package:films_hub/app/blocs/locale_bloc/local_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(Locale('en', 'US'))) {
    on<ChangeLocaleEvent>(_onLocaleChanged);
  }

  void _onLocaleChanged(ChangeLocaleEvent event, Emitter<LocaleState> emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
