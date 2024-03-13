import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/settings/domain/barrel.dart';

part 'language_state.freezed.dart';
part 'language_state.g.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({
    required Language language,
  }) = _LanguageState;

  factory LanguageState.fromJson(Map<String, Object?> json) => _$LanguageStateFromJson(json);
}
