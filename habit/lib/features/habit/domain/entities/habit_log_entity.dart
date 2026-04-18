import 'package:equatable/equatable.dart';

class HabitLogEntity extends Equatable {
  final int id;
  final bool isCompleted;
  final String habitId;
  final String logDate;

  const HabitLogEntity({
    required this.id,
    required this.isCompleted,
    required this.habitId,
    required this.logDate,
  });

  @override
  List<Object?> get props => [id, isCompleted,logDate];
}
