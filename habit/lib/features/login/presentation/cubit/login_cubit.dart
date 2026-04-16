import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/login/domain/use_cases/login_use_case.dart';
import 'package:habit/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  Future<void> getLoginMethod({
    required String email,
    required String password,
  }) async {
    final result = await _loginUseCase.getLogin(
      email: email,
      password: password,
    );
    result.when(
      (success) {
        emit(LoginSuccessState());
      },
      (whenError) {
        emit(LoginErrorState(message: whenError.message));
      },
    );
  }
}
