import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/network_exceptions.dart';
import 'package:habit/core/errors/failure.dart';

import 'package:habit/features/add_habit/data/datasources/add_habit_remote_data_source.dart';
import 'package:habit/features/add_habit/domain/repositories/add_habit_repository_domain.dart';

@LazySingleton(as: AddHabitRepositoryDomain)
class AddHabitRepositoryData implements AddHabitRepositoryDomain {
  final BaseAddHabitRemoteDataSource remoteDataSource;

  AddHabitRepositoryData(this.remoteDataSource);

  @override
  Future<Result<bool, Failure>> getAddHabit({
    required String title,
    required String description,
  }) async {
    try {
      final response = await remoteDataSource.getAddHabit(
        title: title,
        description: description,
      );
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
