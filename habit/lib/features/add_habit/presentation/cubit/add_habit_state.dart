import 'package:equatable/equatable.dart';

abstract class AddHabitState extends Equatable {
  const AddHabitState();

  @override
  List<Object?> get props => [];
}

class AddHabitInitialState extends AddHabitState {}
class AddHabitSuccessState extends AddHabitState {}

class AddHabitErrorState extends AddHabitState {
  final String message;
  const AddHabitErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

