import 'package:equatable/equatable.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_state.dart';

class SearchBackupState extends Equatable {
  final SearchPageState searchState;

  const SearchBackupState({
    required this.searchState,
  });

  SearchBackupState copyWith({
    SearchPageState? searchState,
  }) =>
      SearchBackupState(
        searchState: searchState ?? this.searchState,
      );

  @override
  List<Object> get props => [
        searchState,
      ];
}
