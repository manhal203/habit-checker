import 'package:equatable/equatable.dart';

class HabitLogEntity extends Equatable {
  final int id;
  final bool isCompleted;

  const HabitLogEntity({required this.id, required this.isCompleted});

  @override
  List<Object?> get props => [id, isCompleted];
}
