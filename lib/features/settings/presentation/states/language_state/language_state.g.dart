// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageStateImpl _$$LanguageStateImplFromJson(Map<String, dynamic> json) =>
    _$LanguageStateImpl(
      language: $enumDecode(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$$LanguageStateImplToJson(_$LanguageStateImpl instance) =>
    <String, dynamic>{
      'language': _$LanguageEnumMap[instance.language]!,
    };

const _$LanguageEnumMap = {
  Language.ar: 'ar',
  Language.de: 'de',
  Language.ru: 'ru',
  Language.en: 'en',
};
