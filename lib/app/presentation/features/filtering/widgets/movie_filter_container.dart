import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_state.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/movie_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/not_getting_any_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieFilterContainer extends StatefulWidget {
  final Widget Function(BuildContext context, List<AbstractFilm> films)
      _builder;
  final Widget? tail;

  const MovieFilterContainer({
    Key? key,
    required Widget Function(BuildContext context, List<AbstractFilm> films)
        builder,
    this.tail,
  })  : _builder = builder,
        super(key: key);

  @override
  State<MovieFilterContainer> createState() => _MovieFilterContainerState();
}

class _MovieFilterContainerState extends State<MovieFilterContainer> {
  _MovieFilterContainerState();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 40,
              right: 16,
              bottom: 16,
            ),
            child: MovieFilter(_applyFilter),
          ),
        ),
        BlocBuilder<FilteringPageBloc, FilteringPageState>(
          buildWhen: (oldState, newState) =>
              oldState.filteredFilms.films.length !=
              newState.filteredFilms.films.length,
          builder: (context, state) =>
              widget._builder(context, state.filteredFilms.films),
        ),
        BlocBuilder<FilteringPageBloc, FilteringPageState>(
          buildWhen: (oldState, newState) =>
              oldState.filteredFilms.films.isEmpty !=
              newState.filteredFilms.films.isEmpty,
          builder: (context, state) => SliverToBoxAdapter(
            child: widget.tail ??
                (state.filteredFilms.films.isEmpty
                    ? const NotGettingAnyResults()
                    : const SizedBox()),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: AppStyle.safePadding),
        ),
      ],
    );
  }

  void _applyFilter(AbstractFilter<Future<List<AbstractFilm>>> filter) async {
    context.read<FilteringPageBloc>().add(ApplyFilterEvent(filter: filter));
  }
}
