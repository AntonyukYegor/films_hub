import 'package:films_hub/app/domain/models/languages/language.dart';

mixin LanguageFromString {
  String get language;

  Language stringToLanguage() {
    switch (language) {
      case 'Russian':
        return Language.russian;
      case 'English':
        return Language.english;
      case 'French':
        return Language.french;
      default:
        return Language.unknown;
    }
  }
}
