import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/utils/validators.dart';
import 'package:habit/core/widgets/button/custom_button.dart';
import 'package:habit/core/widgets/field/custom_field.dart';
import 'package:habit/features/login/presentation/cubit/login_cubit.dart';
import 'package:habit/features/login/presentation/cubit/login_state.dart';

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final emailController = useTextEditingController(text: "Manhal@gmail.com");
    final passwordController = useTextEditingController(text: "12341234");

    return Scaffold(
      appBar: AppBar(),
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
              spacing: 16,
              children: [
                AnyImageView(
                  imagePath: 'assets/images/logo/habit_logo.png',
                  height: 200,
                  width: 200,
                ),
                CustomField(
                  controller: emailController,
                  title: "Email",
                  icon: Icons.email_outlined,
                  validator: Validators.validateEmail,
                ),
                CustomField(
                  controller: passwordController,
                  title: "Password",
                  icon: Icons.lock_outline_rounded,
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),

                SizedBox(height: 8),
                CustomButton(
                  title: "Log in",
                  onPressed: () {
                    cubit.getLoginMethod(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
                CustomButton(
                  title: "Sign Up",
                  onPressed: () {
                    context.go(Routes.signUp);
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
