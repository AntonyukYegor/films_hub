import 'package:films_hub/app/models/languages/language.dart';

mixin StringToLanguage {
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
