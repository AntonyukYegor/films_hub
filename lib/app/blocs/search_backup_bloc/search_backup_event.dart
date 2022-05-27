import 'package:equatable/equatable.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_state.dart';

class SearchBackupEvent extends Equatable {
  final SearchPageState searchState;
  const SearchBackupEvent({required this.searchState});

  @override
  List<Object> get props => [searchState];
}