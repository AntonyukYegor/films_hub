abstract class LocaleBase {
  MovieLocalBase get movieLocal;

  FeedLocalBase get feedLocalBase;

  CatalogLocalBase get catalogLocalBase;

  FavouritesLocalBase get favouritesLocalBase;

  CommonLocalBase get commonLocalBase;

  SettingsLocalBase get settingsLocalBase;

  NoFoundLocalBase get noFoundLocalBase;

  ShortDetailsLocalBase get shortDetailsLocalBase;

  FilteringLocalBase get filteringLocalBase;

  SearchLocalBase get searchLocalBase;

  AppLocalBase get appLocalBase;
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
}

abstract class NoFoundLocalBase {
  String get pageNoFound;
}

abstract class ShortDetailsLocalBase {
  String get description;
}

abstract class DetailsMovieLocalBase {
  String get description;

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
