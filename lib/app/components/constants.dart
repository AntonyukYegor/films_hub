import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppStyle {
  static const double appBarBorderRadius = 32;
  static const double blurRadius = 15;
  static const double frostBlurRadiusSigma = 20;
  static const String posterPlaceHolderPath =
      'assets/images/poster-placeholder.jpg';
  static const double safePadding = 80;
  static const String randomBackgroundImageUrl = 'https://picsum.photos/4';
  static const double expandedHeight = 150;
  static const String fontFamily = 'Comfortaa';
  static const Icon feedNavigationBarIcon = Icon(Icons.list);
  static const Icon catalogNavigationBarIcon = Icon(Icons.grid_view);
  static const Icon favouritesNavigationBarIcon = Icon(Icons.favorite);
  static const Duration blurBackgroundFadeAnimationDuration =
      Duration(milliseconds: 750);
}

class MoviePictures {
  static CacheManager pictureCache =
  CacheManager(Config('movieImg', stalePeriod: const Duration(days: 7)));
}
