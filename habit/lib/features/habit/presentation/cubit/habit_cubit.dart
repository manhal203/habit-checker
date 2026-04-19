import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/habit/domain/use_cases/habit_use_case.dart';
import 'package:habit/features/habit/presentation/cubit/habit_state.dart';

class HabitCubit extends Cubit<HabitState> {
  final HabitUseCase _habitUseCase;

  HabitCubit(this._habitUseCase) : super(HabitInitialState()) {
    getHabitMethod();
  }

  Future<void> getHabitMethod() async {
    emit(HabitLoadingState());

    final result = await _habitUseCase.getHabit();
    result.when(
      (success) {
        if (success.isEmpty) {
          emit(HabitIsEmptyState());
        } else {
          emit(HabitSuccessState(habits: success));
        }

      },
      (whenError) {
        emit(HabitErrorState(message: whenError.message));
      },
    );
  }

  Future<void> doneHabitMethod({
    required String habitId,
    required bool isCompleted,
  }) async {
    final result = await _habitUseCase.doneHabit(
      habitId: habitId,
      isCompleted: isCompleted,
    );
    result.when(
      (success) {
        emit(DoneHabitSuccessState());
      },
      (whenError) {
        emit(HabitErrorState(message: whenError.message));
      },
    );
  }

  Future<void> deleteHabitMethod({required String habitId}) async {
    final result = await _habitUseCase.deleteHabitMethod(habitId: habitId);
    result.when(
      (success) {
        emit(DeleteHabitSuccessState());
      },
      (whenError) {
        emit(HabitErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
