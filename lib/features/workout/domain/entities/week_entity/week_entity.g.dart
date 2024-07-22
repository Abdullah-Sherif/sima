// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekEntityImpl _$$WeekEntityImplFromJson(Map<String, dynamic> json) =>
    _$WeekEntityImpl(
      currentWeekNumber: (json['currentWeekNumber'] as num?)?.toInt() ?? 1,
      currentDayNumber: (json['currentDayNumber'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$WeekEntityImplToJson(_$WeekEntityImpl instance) =>
    <String, dynamic>{
      'currentWeekNumber': instance.currentWeekNumber,
      'currentDayNumber': instance.currentDayNumber,
    };
