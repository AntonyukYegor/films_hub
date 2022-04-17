import 'package:films_hub/app/models/languages/language.dart';

mixin StringToLanguage {
  String get language;

  Language stringToLanguage() {
    switch (language) {
      case 'Русский':
        return Language.russian;
      case 'Английский':
        return Language.english;
      case 'Французский':
        return Language.french;
      default:
        return Language.unknown;
    }
  }
}
