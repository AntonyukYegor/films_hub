import 'package:films_hub/app/components/locals/locale_base.dart';

class LocaleEn implements LocaleBase {
  const LocaleEn();

  @override
  MovieLocalBase get movie => MovieLocalEn();

  @override
  FeedLocalBase get feed => FeedLocalEn();

  @override
  CatalogLocalBase get catalog => CatalogLocalEn();

  @override
  FavouritesLocalBase get favourites => FavouritesLocalEn();

  @override
  CommonLocalBase get common => CommonLocalEn();

  @override
  SettingsLocalBase get settings => SettingsLocalEn();

  @override
  NoFoundLocalBase get noFound => NoFoundLocalEn();

  @override
  ShortDetailsLocalBase get shortDetails => ShortDetailsLocalEn();

  @override
  FilteringLocalBase get filtering => FilteringLocalEn();

  @override
  SearchLocalBase get search => SearchLocalEn();

  @override
  AppLocalBase get app => AppLocalEn();

  @override
  DetailsMovieLocalBase get detailsMovie => DetailsMovieLocalEn();
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

  @override
  String get switchLanguage => 'Switch Language';
}

class NoFoundLocalEn implements NoFoundLocalBase {
  @override
  String get pageNoFound => 'Page No Found!';
}

class ShortDetailsLocalEn implements ShortDetailsLocalBase {
  @override
  String get descriptionTitle => 'Description:';
}

class DetailsMovieLocalEn implements DetailsMovieLocalBase {
  @override
  String get descriptionTitle => 'Description';

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
