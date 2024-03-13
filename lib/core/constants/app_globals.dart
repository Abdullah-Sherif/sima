import 'dart:io';

import '../../features/settings/domain/barrel.dart';

class AppGlobals {
  static Language get language {
    try {
      final String defaultLocaleString = Platform.localeName;
      String defaultLanguage = defaultLocaleString.split('_')[0];

      Language language;

      try {
        language = Language.values.byName(defaultLanguage);
      } catch (e) {
        language = Language.en;
      }

      return language;
    } catch (e) {
      return Language.en;
    }
  }
}
