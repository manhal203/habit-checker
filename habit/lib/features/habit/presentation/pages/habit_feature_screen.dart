import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/utils/formatters.dart';
import 'package:habit/core/widgets/card/habit_card.dart';
import 'package:habit/features/habit/presentation/cubit/habit_cubit.dart';
import 'package:habit/features/habit/presentation/cubit/habit_state.dart';

class HabitFeatureScreen extends StatelessWidget {
  const HabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitCubit>();
    final String todayDate = Formatters.formatDate(DateTime.now());

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
        title: AnyImageView(
          imagePath: 'assets/images/logo/habit_logo.png',
          height: 60,
          width: 60,
        ),
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
          if (state is DoneHabitSuccessState ||
              state is DeleteHabitSuccessState) {
            context.read<HabitCubit>().getHabitMethod();
          }
          if (state is HabitErrorState) {
            context.showSnackBar(state.message);
          }
        },
        child: BlocBuilder<HabitCubit, HabitState>(
          builder: (context, state) {
            if (state is HabitSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Text(
                      "Your habits for today ($todayDate)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 170, 210, 125),
                      ),
                    ),

                    SizedBox(height: 10),

                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: state.habits.length,
                      itemBuilder: (context, index) {
                        final habit = state.habits[index];

                        final todayLog = habit.habitLog
                            .where((log) => log.logDate == todayDate)
                            .toList();

                        return Dismissible(
                          direction: .endToStart,
                          key: ValueKey(habit.id),

                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: .only(right: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),

                          onDismissed: (direction) {
                            cubit.deleteHabitMethod(habitId: habit.id);
                          },

                          child: InkWell(
                            onTap: () {
                              if (habit.habitLog.isNotEmpty) {
                                context.showBottomSheet(
                                  widget: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Habit History",
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Color.fromARGB(
                                              255,
                                              170,
                                              210,
                                              125,
                                            ),
                                            fontWeight: .bold,
                                          ),
                                        ),

                                        Divider(),

                                        ...([...habit.habitLog]..sort(
                                              (a, b) => b.logDate.compareTo(
                                                a.logDate,
                                              ),
                                            ))
                                            .map(
                                              (item) => Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      item.logDate,
                                                      style: TextStyle(
                                                        color:
                                                            AppColors.textHint,
                                                      ),
                                                    ),
                                                    trailing: Icon(
                                                      item.isCompleted
                                                          ? Icons
                                                                .check_circle_outline
                                                          : Icons
                                                                .cancel_outlined,
                                                      color: item.isCompleted
                                                          ? const Color.fromARGB(
                                                              170,
                                                              76,
                                                              175,
                                                              79,
                                                            )
                                                          : const Color.fromARGB(
                                                              170,
                                                              244,
                                                              67,
                                                              54,
                                                            ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: AppColors.textHint,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ],
                                    ),
                                  ),
                                );
                              }
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
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return Center(child: Text("Add new Habit"));
          },
        ),
      ),
    );
  }
}
