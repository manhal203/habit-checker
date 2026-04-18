import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/utils/validators.dart';
import 'package:habit/core/widgets/button/custom_button.dart';
import 'package:habit/core/widgets/field/custom_field.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_cubit.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_state.dart';

class AddHabitFeatureScreen extends HookWidget {
  const AddHabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHabitCubit>();
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final keyField = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: AnyImageView(
          imagePath: 'assets/images/logo/habit_logo.png',
          height: 60,
          width: 60,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<AddHabitCubit, AddHabitState>(
          listener: (context, state) {
            context.hideLoading();
            if (state is AddHabitLoadingState) {
              context.showLoading();
            } else if (state is AddHabitSuccessState) {
              context.showSnackBar(
                "Habit has been successfully added",
                isError: false,
              );
              context.pop(true);
            } else if (state is AddHabitErrorState) {
              context.showSnackBar(state.message, isError: true);
            }
          },
          child: Form(
            key: keyField,
            child: Column(
              spacing: 16,
              children: [
                CustomField(
                  controller: titleController,
                  title: 'Enter habit name',
                  validator: Validators.validateName,
                ),
                CustomField(
                  controller: descriptionController,
                  title: 'Add a short description',
                ),
                CustomButton(
                  title: 'Add Habit',
                  onPressed: () {
                    if (keyField.currentState!.validate()) {
                      cubit.getAddHabitMethod(
                        title: titleController.text,
                        description: descriptionController.text,
                      );
                    }
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
