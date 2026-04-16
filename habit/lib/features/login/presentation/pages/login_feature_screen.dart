import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/widgets/button/custom_button.dart';
import 'package:habit/core/widgets/field/custom_field.dart';
import 'package:habit/features/login/presentation/cubit/login_cubit.dart';
import 'package:habit/features/login/presentation/cubit/login_state.dart';

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F0FF),
      appBar: AppBar(title: const Text('Login Screen')),
      body: SingleChildScrollView(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            context.hideLoading();
            switch (state) {
              case LoginLoadingState _:
                context.showLoading();

              case LoginSuccessState _:
                context.go(Routes.habit);

              case LoginErrorState _:
                context.showSnackBar(state.message, isError: true);
                break;
              default:
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomField(
                  controller: emailController,
                  title: "Enter Your Email",
                ),
                CustomField(
                  controller: passwordController,
                  title: "Enter Your Password",
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: "Login",
                  onPressed: () {
                    cubit.getLoginMethod(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
