import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/settings/domain/barrel.dart';
import 'language_state.dart';

final languageControllerProvider = StateNotifierProvider.autoDispose<LanguageController, LanguageState>((ref) {
  return LanguageController();
});

class LanguageController extends StateNotifier<LanguageState> {
  LanguageController() : super(LanguageState(language: AppGlobals.language));

  void changeLanguage(Language language) {
    state = state.copyWith(language: language);
  }
}
