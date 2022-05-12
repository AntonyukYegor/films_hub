import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/data/services/dio/omdb_service.dart';
import 'package:films_hub/app/data/repositories/films/extended_fake_films_repository.dart';
import 'package:films_hub/app/data/repositories/films/omdb_films_repository.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:films_hub/app/presentation/features/favourites/pages/favourites_page.dart';
import 'package:films_hub/app/presentation/features/main/models/tab.dart';
import 'package:films_hub/app/presentation/features/main/models/tabs_source.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/components/behaviors/custom_scroll_behavior.dart';
import 'package:films_hub/app/components/colors/custom_colors.dart';
import 'package:films_hub/app/error_bloc/error_bloc.dart';
import 'package:films_hub/app/error_bloc/error_event.dart';
import 'package:films_hub/app/presentation/features/catalog/pages/catalog_page.dart';
import 'package:films_hub/app/presentation/features/details/pages/details_movie_page.dart';
import 'package:films_hub/app/presentation/features/feed/pages/feed_page.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_block.dart';
import 'package:films_hub/app/presentation/features/main/pages/main_page.dart';
import 'package:films_hub/app/presentation/features/no_found/pages/not_found_page.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_bloc.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_bloc.dart';
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
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child ?? const SizedBox(),
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppLocal.appName,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: CustomColors.darkBlack,
          fontFamily: AppStyle.fontFamily,
          shadowColor: Colors.white.withOpacity(0.08),
          scaffoldBackgroundColor: Colors.black),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        shadowColor: Colors.black.withOpacity(0.3),
        fontFamily: AppStyle.fontFamily,
      ),
      initialRoute: MainPage.navigationPath,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MainPage.navigationPath) {
          return MaterialPageRoute(
            builder: (context) {
              return BlocProvider<ErrorBloc>(
                lazy: false,
                create: (BuildContext providerContext) =>
                    ErrorBloc(providerContext),
                child: RepositoryProvider<AbstractFilmsRepository>(
                  lazy: false,
                  create: (providerContext) => OMDBFilmsRepository(
                    client: OMDBService(
                      onErrorHandler: (String code, String message) {
                        providerContext.read<ErrorBloc>().add(
                            ShowDialogEvent(title: code, message: message));
                      },
                    ),
                  ),
                  child: BlocProvider<FilteringPageBloc>(
                    create: (providerContext) => FilteringPageBloc(),
                    child: BlocProvider<FavouritesBloc>(
                      create: (providerContext) => FavouritesBloc(
                          repository: ExtendedFakeFilmsRepository(),
                          filteringPageBloc:
                              providerContext.read<FilteringPageBloc>()),
                      child: BlocProvider<SearchPageBloc>(
                        lazy: false,
                        create: (providerContext) => SearchPageBloc(
                            filteringPageBloc:
                                providerContext.read<FilteringPageBloc>(),
                            repository: providerContext
                                .read<AbstractFilmsRepository>()),
                        child: RepositoryProvider<AbstractFilmsRepository>(
                          lazy: false,
                          create: (providerContext) =>
                              ExtendedFakeFilmsRepository(),
                          child: RepositoryProvider<TabsSource>(
                            lazy: false,
                            create: (_) => const _BaseTabsSource(
                              [
                                NavigationTab(
                                  icon: FeedLocal.navigationBarIcon,
                                  label: FeedLocal.title,
                                  page: FeedPage(
                                    title: FeedLocal.title,
                                  ),
                                ),
                                NavigationTab(
                                  icon: CatalogLocal.navigationBarIcon,
                                  label: CatalogLocal.title,
                                  page: CatalogPage(
                                    title: CatalogLocal.title,
                                  ),
                                ),
                                NavigationTab(
                                  icon: FavouritesLocal.navigationBarIcon,
                                  label: FavouritesLocal.title,
                                  page: FavouritesPage(
                                    title: FavouritesLocal.title,
                                  ),
                                ),
                              ],
                            ),
                            child: BlocProvider<MainBloc>(
                              create: (providerContext) => MainBloc(
                                  tabsSource:
                                      providerContext.read<TabsSource>()),
                              child: const MainPage(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        if (settings.name == SettingsPage.navigationPath) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return BlocProvider<SettingsBloc>(
                  create: (context) => SettingsBloc(),
                  child: const SettingsPage());
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
