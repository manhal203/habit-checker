
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/network_exceptions.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/add_habit/domain/entities/add_habit_entity.dart';

import 'package:habit/features/add_habit/data/datasources/add_habit_remote_data_source.dart';
import 'package:habit/features/add_habit/data/models/add_habit_model.dart';
import 'package:habit/features/add_habit/domain/repositories/add_habit_repository_domain.dart';

@LazySingleton(as: AddHabitRepositoryDomain)
class AddHabitRepositoryData implements AddHabitRepositoryDomain{
  final BaseAddHabitRemoteDataSource remoteDataSource;


  AddHabitRepositoryData(this.remoteDataSource);

@override
  Future<Result<AddHabitEntity, Failure>> getAddHabit() async {
    try {
      final response = await remoteDataSource.getAddHabit();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
