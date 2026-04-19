import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/utils/validators.dart';
import 'package:habit/core/widgets/button/custom_button.dart';
import 'package:habit/core/widgets/field/custom_field.dart';
import 'package:habit/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:any_image_view/any_image_view.dart';
import 'package:habit/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameController = useTextEditingController();
    final phoneController = useTextEditingController();

    final keyField = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            context.hideLoading();
            switch (state) {
              case SignUpLoadingState _:
                context.showLoading();

              case SignUpSuccessState _:
                context.go(Routes.habit);

              case SignUpErrorState _:
                context.showSnackBar(state.message, isError: true);
                break;
              default:
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: keyField,
              child: Column(
                spacing: 16,
                children: [
                  AnyImageView(
                    imagePath: 'assets/images/logo/habit_logo.png',
                    height: 200,
                    width: 200,
                  ),

                  CustomField(
                    controller: usernameController,
                    title: "Username",
                    validator: Validators.validateName,
                    icon: Icons.person,
                  ),
                  CustomField(
                    controller: emailController,
                    title: "Email",
                    validator: Validators.validateEmail,
                    icon: Icons.email_outlined,
                  ),
                  CustomField(
                    controller: phoneController,
                    title: "Phone",
                    validator: Validators.validatePhone,
                    icon: Icons.phone_iphone,
                    isNumber: true,
                  ),
                  CustomField(
                    controller: passwordController,
                    title: "Password",
                    validator: Validators.validatePassword,
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                  ),
                  SizedBox(height: 8),
                  CustomButton(
                    title: "Sign up",
                    onPressed: () {
                      log(keyField.currentState!.validate().toString());
                      if (keyField.currentState!.validate()) {
                        cubit.getSignUpMethod(
                          username: usernameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),

                  CustomButton(
                    title: "Log in",
                    onPressed: () {
                      context.go(Routes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
