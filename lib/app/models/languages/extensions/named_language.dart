import 'package:films_hub/app/models/languages/language.dart';

extension NamedLanguage on Language {
  String toPrettyString() {
    switch (this) {
      case Language.russian:
        return 'Русский';
      case Language.english:
        return 'Английский';
      case Language.french:
        return 'Французский';
      case Language.unknown:
        return 'Неизвестный';
    }
  }
}
