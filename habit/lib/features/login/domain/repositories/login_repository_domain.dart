import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/failure.dart';

abstract class LoginRepositoryDomain {
    Future<Result<void, Failure>> getLogin({
      required String email,
      required String password
    });
}
