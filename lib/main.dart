import 'package:films_hub/app/blocs/locale_bloc/local_bloc.dart';
import 'package:films_hub/app/blocs/locale_bloc/local_state.dart';
import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/data/repositories/favourites_films_repository.dart';
import 'package:films_hub/app/data/services/dio/omdb_service.dart';
import 'package:films_hub/app/data/repositories/films/omdb_films_repository.dart';
import 'package:films_hub/app/domain/repositories/abstract_favourites_films_repository.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:films_hub/app/presentation/features/favourites/pages/favourites_page.dart';
import 'package:films_hub/app/presentation/features/filtering/bloc/filtering_page_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/main/bloc/main_block.dart';
import 'package:films_hub/app/presentation/features/main/models/tab.dart';
import 'package:films_hub/app/presentation/features/main/models/tabs_source.dart';
import 'package:films_hub/app/domain/repositories/films/abstract_films_repository.dart';
import 'package:films_hub/app/components/behaviors/custom_scroll_behavior.dart';
import 'package:films_hub/app/components/colors/custom_colors.dart';
import 'package:films_hub/app/blocs/error_bloc/error_bloc.dart';
import 'package:films_hub/app/blocs/error_bloc/error_event.dart';
import 'package:films_hub/app/presentation/features/catalog/pages/catalog_page.dart';
import 'package:films_hub/app/presentation/features/details/pages/details_movie_page.dart';
import 'package:films_hub/app/presentation/features/feed/pages/feed_page.dart';
import 'package:films_hub/app/presentation/features/main/pages/main_page.dart';
import 'package:films_hub/app/presentation/features/no_found/pages/not_found_page.dart';
import 'package:films_hub/app/presentation/features/search/bloc/search_page_bloc.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:films_hub/app/presentation/features/settings/pages/settings_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

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
    return RepositoryProvider<AbstractFavouritesFilmsRepository>(
      lazy: false,
      create: (_) => FavouritesFilmsRepository(),
      child: RepositoryProvider<AbstractFilmsRepository>(
        lazy: false,
        create: (context) => OMDBFilmsRepository(
          client: OMDBService(
            onErrorHandler: (String code, String message) {
              context
                  .read<ErrorBloc>()
                  .add(ShowDialogEvent(title: code, message: message));
            },
          ),
        ),
        child: BlocProvider<FavouritesBloc>(
          create: (context) => FavouritesBloc(
              repository: context.read<AbstractFavouritesFilmsRepository>()),
          child: BlocProvider<LocaleBloc>(
            lazy: false,
            create: (_) => LocaleBloc(),
            child: BlocProvider<SettingsBloc>(
              lazy: false,
              create: (context) =>
                  SettingsBloc(context.read<LocaleBloc>())..init(),
              child: BlocProvider<FiltersBloc>(
                lazy: false,
                create: (context) => FiltersBloc(),
                child: BlocProvider<FilteringPageBloc>(
                  lazy: false,
                  create: (context) => FilteringPageBloc(),
                  child: BlocProvider<SearchPageBloc>(
                    lazy: false,
                    create: (context) => SearchPageBloc(
                        filteringPageBloc: context.read<FilteringPageBloc>(),
                        repository: context.read<AbstractFilmsRepository>()),
                    child: BlocBuilder<LocaleBloc, LocaleState>(
                      builder: (context, state) => MaterialApp(
                        locale: state.locale,
                        localizationsDelegates: <
                            LocalizationsDelegate<dynamic>>[
                          GlobalWidgetsLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          MyLocalizationsDelegate(initialLocals),
                        ],
                        supportedLocales: availableLocales.values,
                        builder: (context, child) {
                          return ScrollConfiguration(
                            behavior: CustomScrollBehavior(),
                            child: child ?? const SizedBox(),
                          );
                        },
                        debugShowCheckedModeBanner: false,
                        onGenerateTitle: (BuildContext context) =>
                            context.locale.app.appName,
                        themeMode: ThemeMode.system,
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
                                  create: (context) => ErrorBloc(context),
                                  child: RepositoryProvider<TabsSource>(
                                    lazy: false,
                                    create: (context) => _BaseTabsSource(
                                      [
                                        NavigationTab(
                                          icon: AppStyle.feedNavigationBarIcon,
                                          onGenerateLabel: () =>
                                              context.locale.feed.title,
                                          page: const FeedPage(),
                                        ),
                                        NavigationTab(
                                          icon:
                                              AppStyle.catalogNavigationBarIcon,
                                          onGenerateLabel: () =>
                                              context.locale.catalog.title,
                                          page: const CatalogPage(),
                                        ),
                                        NavigationTab(
                                          icon: AppStyle
                                              .favouritesNavigationBarIcon,
                                          onGenerateLabel: () =>
                                              context.locale.favourites.title,
                                          page: const FavouritesPage(),
                                          // page: const FavouritesPage(),
                                        ),
                                      ],
                                    ),
                                    child: BlocProvider<MainBloc>(
                                      create: (context) => MainBloc(
                                          tabsSource:
                                              context.read<TabsSource>()),
                                      child: const MainPage(),
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                          if (settings.name == SettingsPage.navigationPath) {
                            return MaterialPageRoute(
                              builder: (_) {
                                return const SettingsPage();
                              },
                            );
                          }

                          if (settings.name ==
                              DetailsMoviePage.navigationPath) {
                            final MovieCardModel model =
                                settings.arguments as MovieCardModel;
                            return MaterialPageRoute(
                              builder: (_) {
                                return DetailsMoviePage(model: model);
                              },
                            );
                          }

                          return MaterialPageRoute(
                            builder: (_) => const NotFoundPage(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
