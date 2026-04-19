import 'package:equatable/equatable.dart';
import 'package:habit/features/habit/domain/entities/habit_entity.dart';

abstract class HabitState extends Equatable {
  const HabitState();

  @override
  List<Object?> get props => [];
}

class HabitInitialState extends HabitState {}

class HabitLoadingState extends HabitState {}


class HabitSuccessState extends HabitState {
  final List<HabitEntity> habits;
  const HabitSuccessState({required this.habits});
  @override
  List<Object?> get props => [habits];
}

class HabitIsEmptyState extends HabitState {}

class DoneHabitSuccessState extends HabitState {}

class DeleteHabitSuccessState extends HabitState {}

class HabitErrorState extends HabitState {
  final String message;
  const HabitErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
