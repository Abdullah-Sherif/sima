enum ThemeState {
  dark,
  light,
}

extension ThemeStateX on ThemeState {
  bool get isDark => this == ThemeState.dark;
  bool get isLight => this == ThemeState.light;

  String toJson() {
    return toString().split('.').last;
  }

  static ThemeState fromJson(String json) {
    return ThemeState.values.firstWhere((e) => e.toString().split('.').last == json);
  }
}
