import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_state.dart';

final themeControllerProvider = StateNotifierProvider.autoDispose<ThemeController, ThemeState>((ref) {
  return ThemeController();
});

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(ThemeState.light);

  void toggle() {
    state = state.isLight ? ThemeState.dark : ThemeState.light;
  }
}
