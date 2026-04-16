import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/habit/domain/entities/habit_entity.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository_domain.dart';


@lazySingleton
class HabitUseCase {
  final HabitRepositoryDomain _repositoryData;

  HabitUseCase(this._repositoryData);

   Future<Result<HabitEntity, Failure>> getHabit() async {
    return _repositoryData.getHabit();
  }
}
