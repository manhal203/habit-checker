import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:habit/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitialState());

  Future<void> getSignUpMethod({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    emit(SignUpLoadingState());
    final result = await _signUpUseCase.getSignUp(
      email: email,
      password: password,
      username: username,
      phone: phone,
    );
    result.when(
      (success) {
        emit(SignUpSuccessState());
      },
      (whenError) {
        emit(SignUpErrorState(message: whenError.message));
      },
    );
  }
}
