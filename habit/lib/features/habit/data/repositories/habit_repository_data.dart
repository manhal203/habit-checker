import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/network_exceptions.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/habit/domain/entities/habit_entity.dart';
import 'package:habit/features/habit/data/datasources/habit_remote_data_source.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository_domain.dart';

@LazySingleton(as: HabitRepositoryDomain)
class HabitRepositoryData implements HabitRepositoryDomain {
  final BaseHabitRemoteDataSource remoteDataSource;

  HabitRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HabitEntity>, Failure>> getHabit() async {
    try {
      final response = await remoteDataSource.getHabit();
      return Success(response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> doneHabit({
    required String habitId,
    required bool isCompleted,
  }) async {
    try {
      final response = await remoteDataSource.doneHabit(
        habitId: habitId,
        isCompleted: isCompleted,
      );
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> deleteHabitMethod({
    required String habitId,
  }) async {
    try {
      final response = await remoteDataSource.deleteHabit(habitId: habitId);
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
