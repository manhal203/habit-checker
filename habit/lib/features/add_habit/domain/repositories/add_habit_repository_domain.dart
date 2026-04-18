import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/failure.dart';

abstract class AddHabitRepositoryDomain {
  Future<Result<bool, Failure>> getAddHabit({
    required String title,
    required String description,
  });
}
