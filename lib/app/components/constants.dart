import 'package:flutter/material.dart';

class MovieLocal {
  static const String error = 'Error';
  static const String unknown = 'Unknown';
  static const String search = 'Search';
  static const String more = 'More';
  static const String description = 'Description';
}

class FeedLocal {
  static const title = 'Feed';
  static const Icon navigationBarIcon = Icon(Icons.list);
}

class CatalogLocal {
  static const title = 'Catalog';
  static const Icon navigationBarIcon = Icon(Icons.grid_view);
}

class FavoriteLocal {
  static const title = 'Favorite';
  static const Icon navigationBarIcon = Icon(Icons.favorite);
}

class CommonLocal {
  static const String tab = '     ';
  static const String notGettingAnyResults = "Hmmm, we're not getting any results. Our bad - try another search";
  static const String dontHaveMoreResults = "Don't have more results.";
}

class SettingsLocal {
  static const String title = 'Settings';
  static const String back = 'Back';
  static const String exit = 'Exit';
  static const String user = 'User: ';
  static const String getName = 'Get Name';
  static const String clearName = 'Clear Name';
  static const String saveName = 'Save Name';
}

class NoFoundLocal {
  static const String pageNoFound = 'Page No Found!';
}
class ShortDetailsLocal {
  static const String description = 'Description:';
}

class DetailsMovieLocal {
  static const String description = 'Description: ';
  static const String title = "Details";
  static const String release = 'Release: ';
}

class FilteringLocal {
  static const String byRating = 'By rating:';
  static const String byLanguage = 'By language:';
  static const String byPattern = 'By pattern:';
  static const String title = 'Filters';
  static const String apply = 'Apply';
  static const String reset = 'Reset';
}

class SearchLocal {
  static const String search = 'Search';
}

class AppLocal {
  static const String appName = 'Movies Hub';
}

class AppStyle {
  static const double appBarBorderRadius = 32;
  static const double blurRadius = 15;
  static const double frostBlurRadiusSigma = 20;
  static const String posterPlaceHolderPath = 'assets/images/poster-placeholder.jpg';
  static const double safePadding = 80;
  static const String randomBackgroundImageUrl = 'https://picsum.photos/4';
  static const double expandedHeight = 150;
  static const String fontFamily = 'Comfortaa';
}
