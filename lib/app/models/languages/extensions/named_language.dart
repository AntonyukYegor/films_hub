import 'package:films_hub/app/models/languages/language.dart';

extension NamedLanguage on Language {
  String toPrettyString() {
    switch (this) {
      case Language.russian:
        return 'Russian';
      case Language.english:
        return 'English';
      case Language.french:
        return 'French';
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
      case Language.unknown:
        return 'UNK';
    }
  }
}
