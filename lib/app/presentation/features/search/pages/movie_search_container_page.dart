import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/components/delayed_action.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/movie_filter_container.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/dont_have_more_results.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_bloc.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_event.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_state.dart';
import 'package:films_hub/app/presentation/features/settings/models/settings_arguments.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/not_getting_any_results.dart';
import 'package:films_hub/app/presentation/features/search/widgets/search_field.dart';
import 'package:films_hub/app/presentation/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSearchContainerPage extends StatefulWidget {
  final Widget Function(BuildContext context, List<AbstractFilm> films)
      _builder;

  final Widget Function(BuildContext context) _shimmerBuilder;

  const MovieSearchContainerPage(
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
  State<MovieSearchContainerPage> createState() =>
      _MovieSearchContainerPageState();
}

class _MovieSearchContainerPageState extends State<MovieSearchContainerPage> {
  static const double _appBarBorderRadius = 32;

  ScrollController? _scrollController;

  _MovieSearchContainerPageState();

  @override
  void didChangeDependencies() {
    context.read<SearchPageBloc>().add(ReloadDataEvent());
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
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            expandedHeight: AppStyle.expandedHeight,
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
            title: BlocBuilder<SearchPageBloc, SearchPageState>(
              buildWhen: (oldState, newState) =>
                  oldState.searchText != newState.searchText,
              builder: (context, state) => SearchField(
                initialText: state.searchText,
                onSearchFieldTextChanged: _onSearchFieldTextChanged,
              ),
            ),
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
            return BlocBuilder<SearchPageBloc, SearchPageState>(
                buildWhen: (oldState, newState) => oldState != newState,
                builder: (context, state) {
                  if (state.films.films.isEmpty &&
                      (state.isLoading || state.showShimmer) == false) {
                    return const NotGettingAnyResults();
                  } else {
                    return MovieFilterContainer(
                      builder:
                          (BuildContext context, List<AbstractFilm> films) =>
                              widget._builder(
                        context,
                        films,
                      ),
                      tail: BlocBuilder<SearchPageBloc, SearchPageState>(
                        buildWhen: (oldState, newState) =>
                            oldState.isLoading != newState.isLoading ||
                            oldState.showShimmer != newState.showShimmer,
                        builder: (context, state) =>
                            state.isLoading || state.showShimmer
                                ? widget._shimmerBuilder(context)
                                : (state.page >= state.films.pagesCount)
                                    ? const DontHaveMoreResults()
                                    : const SizedBox(),
                      ),
                    );
                  }
                });
          }),
        ),
      ),
    );
  }

  void _onSearchFieldTextChanged(String text) {
    var searchChangedEvent = SearchChangedEvent(search: text);
    DelayedAction.run(() {
      context.read<SearchPageBloc>().add(searchChangedEvent);
    });
  }

  static const int _paginationOffset = 200;

  void _pagination() {
    if (((_scrollController?.position.pixels ?? 0) >=
        (_scrollController?.position.maxScrollExtent ??
            0 - _paginationOffset))) {
      context.read<SearchPageBloc>().add(FetchDataEvent());
    }
  }

  Future<void> _onRefresh() async {
    context.read<SearchPageBloc>().add(ReloadDataEvent());
  }
}
