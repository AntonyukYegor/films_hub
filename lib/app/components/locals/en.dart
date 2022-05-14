import 'package:films_hub/app/components/locals/locale_base.dart';

class LocaleEn implements LocaleBase {
  @override
  MovieLocalBase get movieLocal => MovieLocalEn();

  @override
  FeedLocalBase get feedLocalBase => FeedLocalEn();

  @override
  CatalogLocalBase get catalogLocalBase => CatalogLocalEn();

  @override
  FavouritesLocalBase get favouritesLocalBase => FavouritesLocalEn();

  @override
  CommonLocalBase get commonLocalBase => CommonLocalEn();

  @override
  SettingsLocalBase get settingsLocalBase => SettingsLocalEn();

  @override
  NoFoundLocalBase get noFoundLocalBase => NoFoundLocalEn();

  @override
  ShortDetailsLocalBase get shortDetailsLocalBase => ShortDetailsLocalEn();

  @override
  FilteringLocalBase get filteringLocalBase => FilteringLocalEn();

  @override
  SearchLocalBase get searchLocalBase => SearchLocalEn();

  @override
  AppLocalBase get appLocalBase => AppLocalEn();
}

class MovieLocalEn implements MovieLocalBase {
  @override
  String get error => 'Error';

  @override
  String get unknown => 'Unknown';

  @override
  String get more => 'More';

  @override
  String get description => 'Description';
}

class FeedLocalEn implements FeedLocalBase {
  @override
  String get title => 'Feed';
}

class CatalogLocalEn implements CatalogLocalBase {
  @override
  String get title => 'Catalog';
}

class FavouritesLocalEn implements FavouritesLocalBase {
  @override
  String get title => 'Favourites';
}

class CommonLocalEn implements CommonLocalBase {
  @override
  String get tab => '     ';

  @override
  String get notGettingAnyResults =>
      "Hmmm, we're not getting any results. Our bad - try another search";

  @override
  String get dontHaveMoreResults => "Don't have more results.";
}

class SettingsLocalEn implements SettingsLocalBase {
  @override
  String get title => 'Settings';

  @override
  String get back => 'Back';

  @override
  String get exit => 'Exit';

  @override
  String get user => 'User: ';

  @override
  String get getName => 'Get Name';

  @override
  String get clearName => 'Clear Name';

  @override
  String get saveName => 'Save Name';
}

class NoFoundLocalEn implements NoFoundLocalBase {
  @override
  String get pageNoFound => 'Page No Found!';
}

class ShortDetailsLocalEn implements ShortDetailsLocalBase {
  @override
  String get description => 'Description:';
}

class DetailsMovieLocalEn implements DetailsMovieLocalBase {
  @override
  String get description => 'Description: ';

  @override
  String get title => "Details";

  @override
  String get release => 'Release: ';
}

class FilteringLocalEn implements FilteringLocalBase {
  @override
  String get byRating => 'By rating:';

  @override
  String get byLanguage => 'By language:';

  @override
  String get byPattern => 'By pattern:';

  @override
  String get title => 'Filters';

  @override
  String get apply => 'Apply';

  @override
  String get reset => 'Reset';
}

class SearchLocalEn implements SearchLocalBase {
  @override
  String get search => 'Search';
}

class AppLocalEn implements AppLocalBase {
  @override
  String get appName => 'Movies Hub';
}
