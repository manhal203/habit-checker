import 'package:equatable/equatable.dart';
import 'package:habit/features/habit/domain/entities/habit_log_entity.dart';

class HabitEntity extends Equatable {
  final String id;
  final String title;
  final String createAt;
  final String description;
  final List<HabitLogEntity> habitLog;

  const HabitEntity({
    required this.id,
    required this.title,
    required this.createAt,
    required this.habitLog, required this.description,
  });

  @override
  List<Object?> get props => [id, title, createAt, habitLog,description];
}
