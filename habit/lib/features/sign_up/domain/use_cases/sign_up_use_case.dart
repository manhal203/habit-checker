import 'package:habit/features/sign_up/domain/repositories/sign_up_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit/core/errors/failure.dart';

@lazySingleton
class SignUpUseCase {
  final SignUpRepositoryDomain _repositoryData;

  SignUpUseCase(this._repositoryData);

  Future<Result<bool, Failure>> getSignUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    return _repositoryData.getSignUp(
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
    );
  }
}
