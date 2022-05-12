import 'dart:async';

import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteringPageBloc extends Bloc<FilteringPageEvent, FilteringPageState> {
  FilteringPageBloc()
      : super(FilteringPageState(
          filteredFilms: Films(0, []),
        )) {
    on<LoadFilterDataEvent>(_onLoadData);
    on<FetchFilterDataEvent>(_onFetchFilterData);
    on<ApplyFilterEvent>(_onFilterApply);
  }

  void _onFilterApply(
      ApplyFilterEvent event, Emitter<FilteringPageState> emit) async {
    emit(state.copyWith(filter: event.filter, filteredFilms: Films(0,await event.filter.apply( Future.value(state.sourceFilms.films))) ));
  }

  void _onFetchFilterData(
      FetchFilterDataEvent event, Emitter<FilteringPageState> emit) async {
    var filteredFilms =
        await state.currentFilter.apply(Future.value(event.source.films));
    var joinedFilms = [
      ...state.filteredFilms.films,
      ...filteredFilms,
    ];
    emit(
      state.copyWith(
        sourceFilms: state.sourceFilms..update(event.source),
        filteredFilms: Films(
          joinedFilms.length,
          joinedFilms,
        ),
      ),
    );
  }

  void _onLoadData(
      LoadFilterDataEvent event, Emitter<FilteringPageState> emit) async {
    var filteredFilms =
        await state.currentFilter.apply(Future.value(event.source.films));
    filteredFilms = filteredFilms;
    emit(state.copyWith(sourceFilms: event.source, filteredFilms: Films(filteredFilms.length, filteredFilms)));
  }
}
