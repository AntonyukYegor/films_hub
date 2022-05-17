import 'package:films_hub/app/presentation/features/filtering/filters_bloc/filters_event.dart';
import 'package:films_hub/app/presentation/features/filtering/filters_bloc/filters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc()
      : super(const FiltersState(
            isExpanded: false,
            voteAverageRange: RangeValues(0, 10),
            selectedLanguages: [],
            textPattern: "")) {
    on<ChangeWidgetExpandedEvent>(_onChangeWidgetExpanded);
    on<ChangeFilterPatternEvent>(_onChangeFilterPattern);
    on<ChangeLanguageFilterEvent>(_onChangeLanguageFilter);
    on<ChangeVoteAverageRangeEvent>(_onChangeVoteAverageRange);
  }

  void _onChangeWidgetExpanded(
      ChangeWidgetExpandedEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(isExpanded: event.isExpanded));
  }

  void _onChangeFilterPattern(
      ChangeFilterPatternEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(textPattern: event.textPattern));
  }

  void _onChangeLanguageFilter(
      ChangeLanguageFilterEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(selectedLanguages: event.selectedLanguage));
  }

  void _onChangeVoteAverageRange(
      ChangeVoteAverageRangeEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(voteAverageRange: event.range));
  }
}
