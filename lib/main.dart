import 'package:films_hub/app/behaviors/custom_scroll_behavior.dart';
import 'package:films_hub/app/models/films/abstract_film.dart';
import 'package:films_hub/app/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/models/movie_list_card_model.dart';
import 'package:films_hub/app/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/repositories/films/extended_fake_films_repository.dart';
import 'package:films_hub/app/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/widgets/filtering/movie_filter.dart';
import 'package:films_hub/app/widgets/movie_list_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const MaterialColor _darkThemeColor = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0x00000000),
      100: Color(0x05050505),
      200: Color(0x10101010),
      300: Color(0xA0A0A0A0),
      400: Color(0xB0B0B0B0),
      500: Color(_bluePrimaryValue),
      600: Color(0xC0C0C0C0),
      700: Color(0xD0D0D0D0),
      800: Color(0xF0F0F0F0),
      900: Color(0xFFFFFFFF),
    },
  );
  static const int _bluePrimaryValue = 0xA0FFFFfF;

  @override
  Widget build(BuildContext context) {
    var fontFamily = "Comfortaa";
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child ?? Container(),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: _darkThemeColor,
          fontFamily: fontFamily,
          shadowColor: Colors.white.withOpacity(0.08),
          scaffoldBackgroundColor: Colors.black),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        shadowColor: Colors.black.withOpacity(0.3),
        fontFamily: fontFamily,
      ),
      home: HomePage(ExtendedFakeFilmsRepository.delayedInMilliseconds(100),title: 'Movies List'),
    );
  }
}

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
              MovieFilter(applyFilter),
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

  Future<void> applyFilter(FilmFutureListFilter filter) async {
    await filter.apply(widget._filmsRepository.filmsAsync()).then((value) {
      setState(() {
        _films.clear();
        _films.addAll(value);
      });
    });
  }
}
