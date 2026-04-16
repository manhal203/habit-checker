import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/add_habit/domain/use_cases/add_habit_use_case.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_state.dart';

class AddHabitCubit extends Cubit<AddHabitState> {
  final AddHabitUseCase _addHabitUseCase;

  AddHabitCubit(this._addHabitUseCase) : super(AddHabitInitialState());

  Future<void> getAddHabitMethod() async {
    final result = await _addHabitUseCase.getAddHabit();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
