import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/habit/domain/entities/habit_entity.dart';

abstract class HabitRepositoryDomain {
  Future<Result<List<HabitEntity>, Failure>> getHabit();
  Future<Result<bool, Failure>> doneHabit({
    required String habitId,
    required bool isCompleted,
  });
  Future<Result<bool, Failure>> deleteHabitMethod({required String habitId});
}
