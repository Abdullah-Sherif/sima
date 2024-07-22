import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_entity.freezed.dart';
part 'week_entity.g.dart';

@freezed
abstract class WeekEntity implements _$WeekEntity {
  factory WeekEntity({
    @Default(1) int currentWeekNumber,
    @Default(1) int currentDayNumber,
  }) = _WeekEntity;
  factory WeekEntity.fromJson(Map<String, dynamic> json) => _$WeekEntityFromJson(json);
}

extension WeekEntityX on WeekEntity {
  int get currentDayIndex => currentDayNumber - 1;

  WeekEntity incrementWeekNumber() {
    return copyWith(currentWeekNumber: currentWeekNumber + 1);
  }

  WeekEntity incrementDayNumber() {
    int currentDayNumber = this.currentDayNumber;
    if (currentDayNumber > 7) {
      return incrementWeekNumber().copyWith(currentDayNumber: 1);
    }
    return copyWith(currentDayNumber: currentDayNumber);
  }
}
