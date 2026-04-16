import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/add_habit/domain/entities/add_habit_entity.dart';
import 'package:habit/features/add_habit/domain/repositories/add_habit_repository_domain.dart';


@lazySingleton
class AddHabitUseCase {
  final AddHabitRepositoryDomain _repositoryData;

  AddHabitUseCase(this._repositoryData);

   Future<Result<AddHabitEntity, Failure>> getAddHabit() async {
    return _repositoryData.getAddHabit();
  }
}
