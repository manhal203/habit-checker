import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/add_habit/domain/repositories/add_habit_repository_domain.dart';


@lazySingleton
class AddHabitUseCase {
  final AddHabitRepositoryDomain _repositoryData;

  AddHabitUseCase(this._repositoryData);

   Future<Result<bool, Failure>> getAddHabit({required String title,required String description}) async {
    return _repositoryData.getAddHabit(title: title,description: description);
  }
}
