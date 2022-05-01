import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/settings_arguments.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/movie_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/widgets/not_getting_any_results.dart';
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
      _MovieFilterContainerPageState();
}

class _MovieFilterContainerPageState extends State<MovieFilterContainerPage> {
  final double _appBarBorderRadius = 32;
  final List<AbstractFilm> _films = [];
  bool _showShimmer = true;

  _MovieFilterContainerPageState();

  @override
  void initState() {
    super.initState();
    widget._filmsRepository.filmsAsync().then((value) {
      if (mounted) {
        setState(() {
          _films.addAll(value);
          _showShimmer = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      Navigator.pushNamed(
                        context,
                        SettingsPage.navigationPath,
                        arguments: const SettingsArguments('Egor'),
                      );
                    },
                  )),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_appBarBorderRadius),
                bottomRight: Radius.circular(_appBarBorderRadius),
              ),
            ),
            flexibleSpace:
                AppBarFlexibleSpace(_appBarBorderRadius, widget.title),
          ),
        ],
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 16, top: 40, right: 16, bottom: 16),
                child: MovieFilter(_applyFilter),
              ),
            ),
            _showShimmer
                ? SliverToBoxAdapter(
                    child: widget._shimmerBuilder(context),
                  )
                : _films.isNotEmpty
                    ? widget._builder(context, _films)
                    : const SliverToBoxAdapter(
                        child: NotGettingAnyResults(),
                      ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 80),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _applyFilter(
      AbstractFilter<Future<List<AbstractFilm>>> filter) async {
    if (mounted) {
      setState(() {
        _showShimmer = true;
        _films.clear();
      });
    }
    await filter.apply(widget._filmsRepository.filmsAsync()).then(
      (value) {
        if (mounted) {
          setState(() {
            _films.clear();
            _films.addAll(value);
            _showShimmer = false;
          });
        }
      },
    );
  }
}
