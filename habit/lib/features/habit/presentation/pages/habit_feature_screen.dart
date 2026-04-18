import 'package:any_image_view/any_image_view.dart';
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
        backgroundColor: Color.fromARGB(255, 200, 243, 146),
        foregroundColor: Colors.white,
        elevation: 4,
        child: Icon(Icons.add, size: 40),
        onPressed: () async {
          context.push(Routes.addHabit).then((value) {
            if (value == true) {
              cubit.getHabitMethod();
            }
          });
        },
      ),
      appBar: AppBar(
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
            context.read<HabitCubit>().getHabitMethod();
          }
          if (state is DeleteHabitSuccessState) {
            context.read<HabitCubit>().getHabitMethod();
          }
        },
        child: BlocBuilder<HabitCubit, HabitState>(
          builder: (context, state) {
            if (state is HabitSuccessState) {
              return Column(
                children: [
                  Padding(
                    padding: .only(top: 20, bottom: 10),
                    child: Center(
                      child: AnyImageView(
                        imagePath: 'assets/images/logo/habit_logo.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),

                 SizedBox(height: 10),

                 Text(
                    "Your habits for today",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 170, 210, 125),
                    ),
                  ),

                 SizedBox(height: 10),

                  Expanded(
                    child: ListView.builder(
                      itemCount: state.habits.length,
                      itemBuilder: (context, index) {
                        final habit = state.habits[index];

                        final todayLog = habit.habitLog
                            .where((log) => log.logDate == state.today)
                            .toList();

                        return Dismissible(
                          direction: .endToStart,
                          key: ValueKey(habit.id),

                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: .only(right: 20),
                            child:  Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),

                          onDismissed: (direction) {
                            cubit.deleteHabitMethod(habitId: habit.id);
                          },

                          child: HabitCard(
                            title: habit.title,
                            description: habit.description,
                            isCompleted: todayLog.isEmpty
                                ? false
                                : todayLog.first.isCompleted,
                            onChanged: (value) {
                              cubit.doneHabitMethod(
                                habitId: habit.id,
                                isCompleted: value,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Center(child: Text("Create new Habit"));
          },
        ),
      ),
    );
  }
}
