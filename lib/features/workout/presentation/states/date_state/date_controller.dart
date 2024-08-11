import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'date_state.dart';

final dateControllerProvider = StateNotifierProvider.autoDispose<DateController, DateState>((ref) {
  return DateController(
    DateState(
      currentDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      dateWithOffset: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    ),
  );
});

class DateController extends StateNotifier<DateState> {
  DateController(
    DateState state,
  ) : super(state) {
    _startDailyUpdateTimer();
  }

  Timer? _dailyUpdateTimer;

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

  void _startDailyUpdateTimer() {
    _dailyUpdateTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _checkForNewDay();
    });
  }

  void _checkForNewDay() {
    final now = DateTime.now();
    if (now.day != state.currentDate.day) {
      state = state.copyWith(currentDate: now);
    }
  }

  @override
  void dispose() {
    _dailyUpdateTimer?.cancel();
    super.dispose();
  }
}
