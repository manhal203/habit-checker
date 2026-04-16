import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/add_habit/domain/entities/add_habit_entity.dart';

abstract class AddHabitRepositoryDomain {
    Future<Result<AddHabitEntity, Failure>> getAddHabit();
}
