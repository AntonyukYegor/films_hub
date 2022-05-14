import 'package:films_hub/app/components/locals/locale_base.dart';

class LocaleRu implements LocaleBase {
  const LocaleRu();

  @override
  MovieLocalBase get movie => MovieLocalRu();

  @override
  FeedLocalBase get feed => FeedLocalRu();

  @override
  CatalogLocalBase get catalog => CatalogLocalRu();

  @override
  FavouritesLocalBase get favourites => FavouritesLocalRu();

  @override
  CommonLocalBase get common => CommonLocalRu();

  @override
  SettingsLocalBase get settings => SettingsLocalRu();

  @override
  NoFoundLocalBase get noFound => NoFoundLocalRu();

  @override
  ShortDetailsLocalBase get shortDetails => ShortDetailsLocalRu();

  @override
  FilteringLocalBase get filtering => FilteringLocalRu();

  @override
  SearchLocalBase get search => SearchLocalRu();

  @override
  AppLocalBase get app => AppLocalRu();

  @override
  DetailsMovieLocalBase get detailsMovie => DetailsMovieLocalRu();
}

class MovieLocalRu implements MovieLocalBase {
  @override
  String get error => 'Ошибка';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get more => 'Больше';

  @override
  String get description => 'Описание';
}

class FeedLocalRu implements FeedLocalBase {
  @override
  String get title => 'Список';
}

class CatalogLocalRu implements CatalogLocalBase {
  @override
  String get title => 'Каталог';
}

class FavouritesLocalRu implements FavouritesLocalBase {
  @override
  String get title => 'Избранное';
}

class CommonLocalRu implements CommonLocalBase {
  @override
  String get tab => '     ';

  @override
  String get notGettingAnyResults =>
      "Хм, по текущему запросу ничего не найдено. Попробуйте запрос с другими параметрами.";

  @override
  String get dontHaveMoreResults => "Результатов больше нет.";
}

class SettingsLocalRu implements SettingsLocalBase {
  @override
  String get title => 'Настройки';

  @override
  String get back => 'Назад';

  @override
  String get exit => 'Выход';

  @override
  String get user => 'Пользователь: ';

  @override
  String get getName => 'Получить имя';

  @override
  String get clearName => 'Очистить имя';

  @override
  String get saveName => 'Сохранить имя';
}

class NoFoundLocalRu implements NoFoundLocalBase {
  @override
  String get pageNoFound => 'Странница не найдена!';
}

class ShortDetailsLocalRu implements ShortDetailsLocalBase {
  @override
  String get descriptionTitle => 'Описание:';
}

class DetailsMovieLocalRu implements DetailsMovieLocalBase {
  @override
  String get descriptionTitle => 'Описание: ';

  @override
  String get title => "Детали";

  @override
  String get release => 'Дата выхода: ';
}

class FilteringLocalRu implements FilteringLocalBase {
  @override
  String get byRating => 'По рейтенгу:';

  @override
  String get byLanguage => 'По языку:';

  @override
  String get byPattern => 'По фразе:';

  @override
  String get title => 'Фильтры';

  @override
  String get apply => 'Применить';

  @override
  String get reset => 'Сброс';
}

class SearchLocalRu implements SearchLocalBase {
  @override
  String get search => 'Поиск';
}

class AppLocalRu implements AppLocalBase {
  @override
  String get appName => 'Movies Hub';
}
