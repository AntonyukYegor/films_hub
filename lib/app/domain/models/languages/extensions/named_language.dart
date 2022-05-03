import 'package:films_hub/app/domain/models/languages/language.dart';

extension NamedLanguage on Language {
  String toPrettyString() {
    switch (this) {
      case Language.russian:
        return 'Russian';
      case Language.english:
        return 'English';
      case Language.french:
        return 'French';
      case Language.spanish:
        return 'Spanish';
      case Language.unknown:
        return 'Unknown';
    }
  }

  String toShortString() {
    switch (this) {
      case Language.russian:
        return 'RU';
      case Language.english:
        return 'ENG';
      case Language.french:
        return 'FR';
      case Language.spanish:
        return 'ES';
      case Language.unknown:
        return 'UNK';
    }
  }
}

extension LanguageString on String {
  Language fromPrettyString() {
    switch (this) {
      case 'Russian':
        return Language.russian;
      case 'English':
        return Language.english ;
      case 'French':
        return Language.french ;
      case 'Spanish':
        return Language.spanish ;
      default :
        return Language.unknown;
    }
  }

  Language fromShortString() {
    switch (this) {
      case 'RU':
        return Language.russian;
      case 'ENG':
        return Language.english ;
      case 'FR':
        return Language.french ;
      case 'ES':
        return Language.spanish;
      default :
        return Language.unknown;
    }
  }
}
