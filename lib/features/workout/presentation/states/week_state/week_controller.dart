import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/workout/barrel.dart';

import 'week_state.dart';

final weekControllerProvider = StateNotifierProvider.autoDispose<WeekController, WeekState>((ref) {
  return WeekController(
    WeekState(weekEntity: WeekEntity()),
  );
});

class WeekController extends StateNotifier<WeekState> {
  WeekController(
    WeekState state,
  ) : super(state);

  void incrementDayNumber() {
    WeekEntity newWeekEntity = state.weekEntity.incrementDayNumber();
    state = state.copyWith(weekEntity: newWeekEntity);
  }

  void incrementWeekNumber() {
    WeekEntity newWeekEntity = state.weekEntity.incrementWeekNumber();
    state = state.copyWith(weekEntity: newWeekEntity);
  }

  void incrementOffset() {
    state = state.copyWith(offset: state.offset + 1);
  }

  void decrementOffset(int limit) {
    if (getCurrentWeekNumberWithOffset(limit) == 1 && getCurrentDayNumberWithOffset(limit) == 1) {
      return;
    }
    state = state.copyWith(offset: state.offset - 1);
  }

  int getCurrentDayNumberWithOffset(int limit) {
    int currentDayNumber = state.weekEntity.currentDayNumber;
    int currentDayWOffset = currentDayNumber + state.offset;
    currentDayWOffset = currentDayWOffset % limit;
    if (currentDayWOffset == 0) {
      currentDayWOffset = limit;
    }
    return currentDayWOffset;
  }

  int getCurrentWeekNumberWithOffset(int limit) {
    int currentWeekNumber = state.weekEntity.currentWeekNumber;
    int currentWeekWOffset = currentWeekNumber + (state.offset ~/ limit);
    return currentWeekWOffset;
  }
}
