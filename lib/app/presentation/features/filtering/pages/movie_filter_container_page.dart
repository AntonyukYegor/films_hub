import 'package:films_hub/app/components/delayed_action.dart';
import 'package:films_hub/app/components/dialogs/error_dialog.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/films/abstract_films.dart';
import 'package:films_hub/app/domain/models/films/films.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/domain/models/settings_arguments.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/dont_have_more_results.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/movie_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/not_getting_any_results.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/search_field.dart';
import 'package:films_hub/app/presentation/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MovieFilterContainerPage extends StatefulWidget {
  final Widget Function(BuildContext context, List<AbstractFilm> films)
      _builder;

  final Widget Function(BuildContext context) _shimmerBuilder;

  const MovieFilterContainerPage(this._filmsRepository,
      {Key? key,
      required this.title,
      required Widget Function(BuildContext context, List<AbstractFilm> films)
          builder,
      required Widget Function(BuildContext context) shimmerBuilder})
      : _builder = builder,
        _shimmerBuilder = shimmerBuilder,
        super(key: key);
  final String title;
  final AbstractFilmsRepository _filmsRepository;

  @override
  State<MovieFilterContainerPage> createState() =>
      MovieFilterContainerPageState();
}

class MovieFilterContainerPageState extends State<MovieFilterContainerPage> {
  static const double _appBarBorderRadius = 32;
  AbstractFilms _films = Films(0, []);
  bool _showShimmer = true;
  ScrollController? _scrollController;
  bool _isLoading = false;
  int _page = 1;

  final List<AbstractFilm> _filteredFilms = [];

  MovieFilterContainerPageState();

  String _searchText = "Batman";
  AbstractFilter<Future<List<AbstractFilm>>> _currentFilter =
      FilmFutureListFilter.empty();

  @override
  void initState() {
    _fetchDataForPage(_page);
    _scrollController?.addListener(_pagination);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
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
                  child: SearchField(
                    initialText: _searchText,
                    onSearchFieldTextChanged: _onSearchFieldTextChanged,
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
                widget._builder(context, _filteredFilms),
                SliverToBoxAdapter(
                  child: _isLoading || _showShimmer
                      ? widget._shimmerBuilder(context)
                      : Container(),
                ),
                SliverToBoxAdapter(
                  child: (_isLoading == false && _filteredFilms.isEmpty)
                      ? const NotGettingAnyResults()
                      : Container(),
                ),
                SliverToBoxAdapter(
                  child: (_isLoading == false &&
                          _films.films.isNotEmpty &&
                          _films.pagesCount <= _page)
                      ? const DontHaveMoreResults()
                      : Container(),
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

  Future<void> _applyFilter(
      AbstractFilter<Future<List<AbstractFilm>>> filter) async {
    _currentFilter = filter;
    _performFiltration();
  }

  void _performFiltration() {
    if (mounted) {
      setState(() {
        _showShimmer = true;
        _filteredFilms.clear();
      });
    }

    _addFilteredFilms(_films);
  }

  Future<void> _addFilteredFilms(AbstractFilms film) async {
    await _currentFilter.apply(Future.value(film.films)).then(
      (value) {
        if (mounted) {
          setState(() {
            _filteredFilms.addAll(value);
            _showShimmer = false;
          });
        }
      },
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      if (_searchText != text) {
        setState(() {
          _searchText = text;
        });
        _reload();
      }
    });
  }

  void _fetchDataForPage(int page) async {
    setState(() {
      _isLoading = true;
      _showShimmer = true;
    });
    widget._filmsRepository
        .filmsAsync(
            searchQuery: _searchText,
            errorCallback: errorCallbackMethod,
            page: page)
        .then((value) {
      if (mounted) {
        setState(() {
          if (_films.films.isNotEmpty) {
            _films.addAll(value.films);
          } else {
            _films = value;
          }
          _addFilteredFilms(value);
          _isLoading = false;
        });
      }
    });
  }

  void errorCallbackMethod(String errorMessage) {
    showErrorDialog(context, error: errorMessage);
  }

  static const int _paginationOffset = 200;

  void _pagination() {
    if (_isLoading == false &&
        ((_scrollController?.position.pixels ?? 0) >=
            (_scrollController?.position.maxScrollExtent ??
                0 - _paginationOffset)) &&
        (_films.pagesCount > _page)) {
      setState(() {
        _page += 1;
        _fetchDataForPage(_page);
      });
    }
  }

  Future<void> _onRefresh() async {
    await _reload();
  }

  Future<void> _reload() async {
    setState(() {
      _filteredFilms.clear();
      _films.clear();
      _page = 1;
      _showShimmer = false;
      _fetchDataForPage(_page);
    });
  }
}
