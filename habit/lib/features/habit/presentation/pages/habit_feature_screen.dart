import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/habit/presentation/cubit/habit_cubit.dart';

class HabitFeatureScreen extends StatelessWidget {
  const HabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<HabitCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Habit Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
