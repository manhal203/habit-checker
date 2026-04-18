import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/habit/domain/entities/habit_entity.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository_domain.dart';

@lazySingleton
class HabitUseCase {
  final HabitRepositoryDomain _repositoryData;

  HabitUseCase(this._repositoryData);

  Future<Result<List<HabitEntity>, Failure>> getHabit() async {
    return _repositoryData.getHabit();
  }

  Future<Result<bool, Failure>> doneHabit({required String habitId, required bool isCompleted}) async {
    return _repositoryData.doneHabit(habitId: habitId,isCompleted: isCompleted);
  }
}
