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
      backgroundColor: const Color(0xFFF5F0FF),
      appBar: AppBar(title: const Text('SignUp Screen')),
      body: SingleChildScrollView(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            context.hideLoading();
            switch (state) {
              case SignUpLoadingState _:
                context.showLoading();

              case SignUpSuccessState _:
                context.go(Routes.login);
              //context.showSnackBar("SignUp Done", isError: false);

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
                children: [
                  CustomField(
                    controller: usernameController,
                    title: "Enter Your Username",
                    validator: Validators.validateUsername,
                  ),
                  CustomField(
                    controller: emailController,
                    title: "Enter Your Email",
                    validator: Validators.validateEmail,
                  ),
                  CustomField(
                    controller: phoneController,
                    title: "Enter Your Phone",
                    validator: Validators.validatePhone,
                  ),
                  CustomField(
                    controller: passwordController,
                    title: "Enter Your Password",
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    title: "Create Account",
                    onPressed: () {
                      cubit.getSignUpMethod(
                        username: usernameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        password: passwordController.text,
                      );
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
