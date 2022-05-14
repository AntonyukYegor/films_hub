import 'package:films_hub/app/components/locals/locale_base.dart';

class LocaleRu implements LocaleBase {
  @override
  MovieLocalBase get movieLocal => MovieLocalRu();

  @override
  FeedLocalBase get feedLocalBase => FeedLocalRu();

  @override
  CatalogLocalBase get catalogLocalBase => CatalogLocalRu();

  @override
  FavouritesLocalBase get favouritesLocalBase => FavouritesLocalRu();

  @override
  CommonLocalBase get commonLocalBase => CommonLocalRu();

  @override
  SettingsLocalBase get settingsLocalBase => SettingsLocalRu();

  @override
  NoFoundLocalBase get noFoundLocalBase => NoFoundLocalRu();

  @override
  ShortDetailsLocalBase get shortDetailsLocalBase => ShortDetailsLocalRu();

  @override
  FilteringLocalBase get filteringLocalBase => FilteringLocalRu();

  @override
  SearchLocalBase get searchLocalBase => SearchLocalRu();

  @override
  AppLocalBase get appLocalBase => AppLocalRu();
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
  String get description => 'Описание:';
}

class DetailsMovieLocalRu implements DetailsMovieLocalBase {
  @override
  String get description => 'Описание: ';

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
