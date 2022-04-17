Задание:

1. Создать абстрактный класс для фильма со следующими полями: String id, String title, String picture, double voteAverage, String releaseDate, String description, String language,
2. Создать обычный класс фильма и отнаследоваться от абстрактного
3. Создать примесь для конвертации языка из строки в enum Language и добавить к классу
4. Создать расширение для Language с методом toPrettyString(), возвращающим строку с названием языка (например, Language.russian - “Русский”, Language.english - “Английский”)
5. Создать асинхронную функцию, возвращающую список фильмов (сам список можно просто задавать напрямую)
6. Создать функцию для фильтрации фильмов по любому параметру (например, рейтинг)
Примечание:

1. Функция возвращающая список фильмов была вынесенна в абстракную репозиторию, констракт которой был имплементирован в FakeFilmsRepository.
2. Функциональность фильтрации была реализованна на основе объектов фильтров, такое решение расширяемое, в том числе поддерживается многослойная фильтрация. С логикой использования классов можно ознакомиться с помощью unit тестов находящихся в /test/films_filters_test.dart
