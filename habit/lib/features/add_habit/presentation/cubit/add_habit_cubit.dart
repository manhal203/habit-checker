import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/add_habit/domain/use_cases/add_habit_use_case.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_state.dart';

class AddHabitCubit extends Cubit<AddHabitState> {
  final AddHabitUseCase _addHabitUseCase;

  AddHabitCubit(this._addHabitUseCase) : super(AddHabitInitialState());

  Future<void> getAddHabitMethod({
    required String title,
    required String description,
  }) async {
    final result = await _addHabitUseCase.getAddHabit(
      title: title,
      description: description,
    );

    result.when(
      (success) {
        emit(AddHabitSuccessState());
      },
      (whenError) {
        emit(AddHabitErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
