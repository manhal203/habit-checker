import 'package:equatable/equatable.dart';

abstract class HabitState extends Equatable {
  const HabitState();

  @override
  List<Object?> get props => [];
}

class HabitInitialState extends HabitState {}
class HabitSuccessState extends HabitState {}

class HabitErrorState extends HabitState {
  final String message;
  const HabitErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

