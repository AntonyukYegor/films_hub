import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/movie_list_card_model.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/presentation/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/widgets/filtering/movie_filter.dart';
import 'package:films_hub/app/presentation/widgets/movie_list_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(this._filmsRepository, {Key? key, required this.title})
      : super(key: key);
  final String title;
  final AbstractFilmsRepository _filmsRepository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _appBarBorderRadius = 32;
  final List<AbstractFilm> _films = [];

  _HomePageState();

  @override
  void initState() {
    super.initState();
    widget._filmsRepository.filmsAsync().then((value) {
      setState(() {
        _films.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 100,
            pinned: true,
            elevation: 0,
            centerTitle: true,
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MovieFilter(_applyFilter),
              ...List.generate(_films.length, (index) {
                var film = _films[index];
                var cardModel = MovieListCardModel.fromFilmModel(film);
                return MovieListCard(
                  cardModel: cardModel,
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _applyFilter(
      AbstractFilter<Future<List<AbstractFilm>>> filter) async {
    await filter.apply(widget._filmsRepository.filmsAsync()).then((value) {
      setState(() {
        _films.clear();
        _films.addAll(value);
      });
    });
  }
}
