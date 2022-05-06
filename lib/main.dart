import 'package:films_hub/app/data/clients/omdb_client.dart';
import 'package:films_hub/app/data/repositories/films/omdb_films_repository.dart';
import 'package:films_hub/app/domain/models/movie_list_card_model.dart';
import 'package:films_hub/app/domain/models/settings_arguments.dart';
import 'package:films_hub/app/domain/models/tab.dart';
import 'package:films_hub/app/domain/models/tabs_source.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/components/behaviors/custom_scroll_behavior.dart';
import 'package:films_hub/app/components/colors/custom_colors.dart';
import 'package:films_hub/app/error_bloc/error_bloc.dart';
import 'package:films_hub/app/error_bloc/error_event.dart';
import 'package:films_hub/app/presentation/features/catalog/pages/catalog_page.dart';
import 'package:films_hub/app/presentation/features/details/pages/details_movie_page.dart';
import 'package:films_hub/app/presentation/features/feed/pages/feed_page.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_block.dart';
import 'package:films_hub/app/presentation/features/main/pages/main_page.dart';
import 'package:films_hub/app/presentation/features/no_found/pages/not_found_page.dart';
import 'package:films_hub/app/presentation/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class _BaseTabsSource implements TabsSource {
  const _BaseTabsSource(this._tabs);

  final List<NavigationTab> _tabs;

  @override
  int get count => _tabs.length;

  @override
  List<NavigationTab> get tabs => _tabs;

  @override
  Widget pageAt(int index) => _tabs.elementAt(index).page;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        title: 'Movies Hub',
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: CustomColors.darkBlack,
            fontFamily: fontFamily,
            shadowColor: Colors.white.withOpacity(0.08),
            scaffoldBackgroundColor: Colors.black),
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          shadowColor: Colors.black.withOpacity(0.3),
          fontFamily: fontFamily,
        ),
        initialRoute: MainPage.navigationPath,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == MainPage.navigationPath) {
                return MaterialPageRoute(
              builder: (context) {
                return  BlocProvider<ErrorBloc>(
                  lazy: false,
                  create: (_) => ErrorBloc(context),
                  child: RepositoryProvider<OMDBClient>(
                    lazy: false,
                      create : (BuildContext context) =>
                          OMDBClient(onErrorHandler: (String code, String message) {
                            context
                                .read<ErrorBloc>()
                                .add(ShowDialogEvent(title: code, message: message));
                          }),
                    child: RepositoryProvider<AbstractFilmsRepository>(
                        lazy: false,
                        create: (BuildContext context) =>
                            OMDBFilmsRepository(client: context.read<OMDBClient>()),
                        child: RepositoryProvider<TabsSource>(
                          lazy: false,
                          create: (BuildContext context) => _BaseTabsSource(
                            [
                              NavigationTab(
                                icon: const Icon(Icons.list),
                                label: 'Feed',
                                page: FeedPage(
                                  title: 'Feed',
                                  filmsRepository: context.read<AbstractFilmsRepository>(),
                                ),
                              ),
                              NavigationTab(
                                icon: const Icon(Icons.grid_view),
                                label: 'Catalog',
                                page: CatalogPage(
                                  title: 'Catalog',
                                  filmsRepository: context.read<AbstractFilmsRepository>(),
                                ),
                              ),
                            ],
                          ),
                          child: BlocProvider<MainBloc>(
                            create: (BuildContext context) =>
                                MainBloc(tabsSource: context.read<TabsSource>()),
                            child: const MainPage(),
                          ),
                        )),
                  ),
                );
              },
            );
          }

          if (settings.name == SettingsPage.navigationPath) {
            final SettingsArguments arguments =
                settings.arguments as SettingsArguments;
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return SettingsPage(arguments: arguments);
              },
            );
          }

          if (settings.name == DetailsMoviePage.navigationPath) {
            final MovieCardModel model = settings.arguments as MovieCardModel;
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return DetailsMoviePage(model: model);
              },
            );
          }

          return MaterialPageRoute(
            builder: (_) => const NotFoundPage(),
          );
        },
      );
  }
}
