import 'package:flutter/material.dart';

enum Language {
  ar,
  de,
  ru,
  en,
}

extension LanguageX on Language {
  Locale get locale {
    switch (this) {
      case Language.ar:
        return const Locale('ar', 'EG');
      case Language.en:
        return const Locale('en', 'GB');
      case Language.de:
        return const Locale('de', 'DE');
      case Language.ru:
        return const Locale('ru', 'RU');
    }
  }

  String toJson() {
    return toString().split('.').last;
  }

  static Language fromJson(String json) {
    return Language.values.firstWhere((e) => e.toString().split('.').last == json);
  }
}

extension LanguagesX on List<Language> {
  List<Locale> get locales => map((e) => e.locale).toList();
}
