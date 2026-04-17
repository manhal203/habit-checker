import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_cubit.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_state.dart';

class AddHabitFeatureScreen extends HookWidget {
  const AddHabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHabitCubit>();
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('AddHabit Feature Screen')),
      body: BlocListener<AddHabitCubit, AddHabitState>(
        listener: (context, state) {
          if (state is AddHabitSuccessState) {
            context.showSnackBar(
              "Habit has been successfully added",
              isError: false,
            );
            context.pop(true);
          }
          if (state is AddHabitErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Enter new Title"),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Enter new Description"),
              ),
            ),
            FilledButton(
              onPressed: () {
                cubit.getAddHabitMethod(
                  title: titleController.text,
                  description: descriptionController.text,
                );
              },
              child: Text("save"),
            ),
          ],
        ),
      ),
    );
  }
}
