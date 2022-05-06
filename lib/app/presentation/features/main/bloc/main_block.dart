import 'package:films_hub/app/domain/models/tabs_source.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_event.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required TabsSource tabsSource})
      : super(MainState(selectedIndex: 0, tabsSource: tabsSource)) {
    on<SelectedIndexChangedEvent>(_onChangedSelectedIndex);
  }

  void _onChangedSelectedIndex(
      SelectedIndexChangedEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
