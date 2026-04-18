import 'package:habit/core/errors/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SignUpRepositoryDomain {
  Future<Result<bool, Failure>> getSignUp({
    required String email,
    required String password,
    required String username,
    required String phone,
  });
}
