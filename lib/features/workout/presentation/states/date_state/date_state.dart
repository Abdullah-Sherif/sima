import 'package:equatable/equatable.dart';

class DateState extends Equatable {
  const DateState({
    required this.currentDate,
    required this.dateWithOffset,
  });

  final DateTime currentDate;
  final DateTime dateWithOffset;

  DateState copyWith({
    DateTime? currentDate,
    DateTime? dateWithOffset,
  }) {
    return DateState(
      currentDate: currentDate ?? this.currentDate,
      dateWithOffset: dateWithOffset ?? this.dateWithOffset,
    );
  }

  @override
  List<Object?> get props => [currentDate, dateWithOffset];
}
