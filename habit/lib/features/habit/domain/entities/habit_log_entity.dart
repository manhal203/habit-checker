import 'package:equatable/equatable.dart';

class HabitLogEntity extends Equatable {
  final int id;
  final bool isCompleted;
  final String habitId;

  const HabitLogEntity({required this.id, required this.isCompleted,required this.habitId});

  @override
  List<Object?> get props => [id, isCompleted];
}
