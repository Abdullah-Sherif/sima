import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'date_state.dart';

final dateControllerProvider = StateNotifierProvider.autoDispose<DateController, DateState>((ref) {
  return DateController(
    DateState(
      currentDate: DateTime.now(),
      dateWithOffset: DateTime.now(),
    ),
  );
});

class DateController extends StateNotifier<DateState> {
  DateController(
    DateState state,
  ) : super(state);

  void incrementDate() {
    state = state.copyWith(
      dateWithOffset: state.dateWithOffset.add(const Duration(days: 1)),
    );
  }

  void decrementDate() {
    state = state.copyWith(
      dateWithOffset: state.dateWithOffset.subtract(const Duration(days: 1)),
    );
  }
}
