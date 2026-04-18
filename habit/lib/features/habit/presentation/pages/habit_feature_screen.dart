import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/widgets/card/habit_card.dart';
import 'package:habit/features/habit/presentation/cubit/habit_cubit.dart';
import 'package:habit/features/habit/presentation/cubit/habit_state.dart';
import 'package:sizer/sizer.dart';

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
      appBar: AppBar(title: const Text('Habit Feature Screen')),
      body: BlocListener<HabitCubit, HabitState>(
        listener: (context, state) {
          if (state is DoneHabitSuccessState) {
            cubit.getHabitMethod();
          }
          if (state is DeleteHabitSuccessState) {
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
                  final todayLog = habit.habitLog
                      .where((log) => log.logDate == state.today)
                      .toList();
                  return Dismissible(
                    direction: .endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: .centerRight,
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete),
                    ),
                    onDismissed: (direction) {
                      cubit.deleteHabitMethod(habitId: habit.id);
                    },
                    key: ValueKey(habit.createAt),
                    child: HabitCard(
                      title: habit.title,
                      description: habit.description,
                      isCompleted: todayLog.isEmpty
                          ? false
                          : (todayLog.first.isCompleted),
                      onChanged: (value) {
                        cubit.doneHabitMethod(
                          habitId: habit.id,
                          isCompleted: value,
                        );
                      },
                    ),
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
