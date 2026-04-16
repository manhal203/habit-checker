import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/habit/domain/use_cases/habit_use_case.dart';
import 'package:habit/features/habit/presentation/cubit/habit_state.dart';

class HabitCubit extends Cubit<HabitState> {
  final HabitUseCase _habitUseCase;

  HabitCubit(this._habitUseCase) : super(HabitInitialState());

  Future<void> getHabitMethod() async {
    final result = await _habitUseCase.getHabit();
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
