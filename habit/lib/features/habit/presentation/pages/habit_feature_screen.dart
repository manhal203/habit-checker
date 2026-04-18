import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/widgets/card/habit_card.dart';
import 'package:habit/features/habit/presentation/cubit/habit_cubit.dart';
import 'package:habit/features/habit/presentation/cubit/habit_state.dart';

class HabitFeatureScreen extends StatelessWidget {
  const HabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.push(Routes.addHabit).then((value) {
            if (value == true) {
              cubit.getHabitMethod();
            }
          });
        },
      ),
      appBar: AppBar(
        title: const Text('Habit Feature Screen'),
        actions: [
          IconButton(
            onPressed: () {
              context.go(Routes.login);
            },
            icon: Icon(Icons.exit_to_app, color: Colors.redAccent),
          ),
        ],
      ),
      body: BlocListener<HabitCubit, HabitState>(
        listener: (context, state) {
          if (state is DoneHabitSuccessState) {
            cubit.getHabitMethod();
          }
        },
        child: BlocBuilder<HabitCubit, HabitState>(
          builder: (context, state) {
            if (state is HabitSuccessState) {
              return ListView.builder(
                itemCount: state.habits.length,
                itemBuilder: (context, index) {
                  final habit = state.habits[index];
                  return HabitCard(
                    title: habit.title,
                    description: habit.description,
                    isCompleted: habit.habitLog.last.isCompleted,
                    onChanged: (value) {
                      cubit.doneHabitMethod(
                        habitId: habit.habitLog.last.habitId,
                        isCompleted: value,
                      );
                    },
                  );
                },
              );
            }
            return Text("Create new Habit");
          },
        ),
      ),
    );
  }
}
