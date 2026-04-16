import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_cubit.dart';

class AddHabitFeatureScreen extends StatelessWidget {
  const AddHabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<AddHabitCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('AddHabit Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
