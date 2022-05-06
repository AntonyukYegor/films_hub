import 'package:films_hub/app/components/delayed_action.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/settings_arguments.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_event.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_state.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/dont_have_more_results.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/movie_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/not_getting_any_results.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/search_field.dart';
import 'package:films_hub/app/presentation/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieFilterContainerPage extends StatefulWidget {
  final Widget Function(BuildContext context, List<AbstractFilm> films)
      _builder;

  final Widget Function(BuildContext context) _shimmerBuilder;

  const MovieFilterContainerPage(
      {Key? key,
      required this.title,
      required Widget Function(BuildContext context, List<AbstractFilm> films)
          builder,
      required Widget Function(BuildContext context) shimmerBuilder})
      : _builder = builder,
        _shimmerBuilder = shimmerBuilder,
        super(key: key);
  final String title;

  @override
  State<MovieFilterContainerPage> createState() =>
      _MovieFilterContainerPageState();
}

class _MovieFilterContainerPageState extends State<MovieFilterContainerPage> {
  static const double _appBarBorderRadius = 32;

  ScrollController? _scrollController;

  _MovieFilterContainerPageState();

  @override
  void didChangeDependencies() {
    context.read<FilteringPageBloc>().add(ReloadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 100,
            pinned: true,
            elevation: 0,
            centerTitle: true,
            actions: [
              Theme(
                  data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent),
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pushNamed(
                        context,
                        SettingsPage.navigationPath,
                        arguments: const SettingsArguments('Egor'),
                      );
                    },
                  )),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_appBarBorderRadius),
                bottomRight: Radius.circular(_appBarBorderRadius),
              ),
            ),
            flexibleSpace:
                AppBarFlexibleSpace(_appBarBorderRadius, widget.title),
          ),
        ],
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Builder(builder: (context) {
            _scrollController ??= PrimaryScrollController.of(context)
              ?..addListener(_pagination);
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<FilteringPageBloc, FilteringPageState>(
                    buildWhen: (oldState, newState) =>
                        oldState.searchText != newState.searchText,
                    builder: (context, state) => SearchField(
                      initialText: state.searchText,
                      onSearchFieldTextChanged: _onSearchFieldTextChanged,
                    ),
                  ),
                ),
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
                      oldState.filteredFilms != newState.filteredFilms,
                  builder: (context, state) =>
                      widget._builder(context, state.filteredFilms.films),
                ),
                BlocBuilder<FilteringPageBloc, FilteringPageState>(
                  buildWhen: (oldState, newState) =>
                      oldState.isLoading != newState.isLoading ||
                      oldState.showShimmer != newState.showShimmer,
                  builder: (context, state) => SliverToBoxAdapter(
                    child: state.isLoading || state.showShimmer
                        ? widget._shimmerBuilder(context)
                        : const SizedBox(),
                  ),
                ),
                BlocBuilder<FilteringPageBloc, FilteringPageState>(
                  buildWhen: (oldState, newState) =>
                      oldState.isLoading != newState.isLoading &&
                      newState.films.films.isEmpty !=
                          oldState.films.films.isEmpty,
                  builder: (context, state) => SliverToBoxAdapter(
                    child: (state.isLoading == false &&
                            state.filteredFilms.films.isEmpty)
                        ? const NotGettingAnyResults()
                        : const SizedBox(),
                  ),
                ),
                BlocBuilder<FilteringPageBloc, FilteringPageState>(
                  buildWhen: (oldState, newState) =>
                      oldState.isLoading != newState.isLoading &&
                      newState.page != oldState.page,
                  builder: (context, state) => SliverToBoxAdapter(
                    child: (state.isLoading == false &&
                            state.filteredFilms.films.isNotEmpty &&
                            state.page >= state.films.pagesCount)
                        ? const DontHaveMoreResults()
                        : const SizedBox(),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 80),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _applyFilter(AbstractFilter<Future<List<AbstractFilm>>> filter) async {
    context.read<FilteringPageBloc>().add(ApplyFilterEvent(filter: filter));
  }

  void _onSearchFieldTextChanged(String text) {
    var searchChangedEvent = SearchChangedEvent(search: text);
    DelayedAction.run(() {
      context.read<FilteringPageBloc>().add(searchChangedEvent);
    });
  }

  static const int _paginationOffset = 200;

  void _pagination() {
    if (((_scrollController?.position.pixels ?? 0) >=
        (_scrollController?.position.maxScrollExtent ??
            0 - _paginationOffset))) {
      context.read<FilteringPageBloc>().add(FetchDataEvent());
    }
  }

  Future<void> _onRefresh() async {
    context.read<FilteringPageBloc>().add(ReloadDataEvent());
  }
}
