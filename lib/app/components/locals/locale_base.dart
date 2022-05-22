abstract class LocaleBase {
  MovieLocalBase get movie;

  FeedLocalBase get feed;

  CatalogLocalBase get catalog;

  FavouritesLocalBase get favourites;

  CommonLocalBase get common;

  SettingsLocalBase get settings;

  NoFoundLocalBase get noFound;

  ShortDetailsLocalBase get shortDetails;

  DetailsMovieLocalBase get detailsMovie;

  FilteringLocalBase get filtering;

  SearchLocalBase get search;

  AppLocalBase get app;
}

abstract class MovieLocalBase {
  String get error;

  String get unknown;

  String get more;

  String get description;
}

abstract class FeedLocalBase {
  String get title;
}

abstract class CatalogLocalBase {
  String get title;
}

abstract class FavouritesLocalBase {
  String get title;
}

abstract class CommonLocalBase {
  String get tab;

  String get notGettingAnyResults;

  String get dontHaveMoreResults;
}

abstract class SettingsLocalBase {
  String get title;

  String get back;

  String get exit;

  String get user;

  String get getName;

  String get clearName;

  String get saveName;

  String get switchLanguage;

  String get darkThemeMode;

  String get lightThemeMode;

  String get systemThemeMode;

}

abstract class NoFoundLocalBase {
  String get pageNoFound;
}

abstract class ShortDetailsLocalBase {
  String get descriptionTitle;
}

abstract class DetailsMovieLocalBase {
  String get descriptionTitle;

  String get title;

  String get release;
}

abstract class FilteringLocalBase {
  String get byRating;

  String get byLanguage;

  String get byPattern;

  String get title;

  String get apply;

  String get reset;
}

abstract class SearchLocalBase {
  String get search;
}

abstract class AppLocalBase {
  String get appName;
}
