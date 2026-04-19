import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/utils/formatters.dart';
import 'package:habit/core/widgets/card/habit_card.dart';
import 'package:habit/core/widgets/loading_widget.dart';
import 'package:habit/features/habit/presentation/cubit/habit_cubit.dart';
import 'package:habit/features/habit/presentation/cubit/habit_state.dart';
import 'package:habit/features/habit/presentation/widgets/count_card_widget.dart';
import 'package:lottie/lottie.dart';

class HabitFeatureScreen extends StatelessWidget {
  const HabitFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitCubit>();
    final String todayDate = Formatters.formatDate(DateTime.now());

    return Scaffold(
      drawer: Drawer(
        child: BlocBuilder<HabitCubit, HabitState>(
          builder: (context, state) {
            if (state is HabitSuccessState) {
              int allLogs = 0;
              state.habits.map((item) {allLogs += item.habitLog.length;}).toList();
              int completedLogs = 0;
              state.habits.map((item) {completedLogs += item.habitLog.fold(0, (count , item2) => item2.isCompleted ? count + 1 : count );}).toList();

              print("all logs: $allLogs ==== completed`; $completedLogs");
              return Column(
                mainAxisAlignment: .center,
                spacing: 20,
                children: [
                  Text(
                    'Habit Analysis',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: .bold,
                      color: AppColors.darkGreen,
                    ),
                  ),
                  Divider(color: AppColors.divider),

                  CountCardWidget(
                    color: const Color.fromARGB(255, 242, 231, 130),
                    title: "All Tasks",
                    count: 57,
                  ),

                  CountCardWidget(
                    color: AppColors.lightGreen,
                    title: "Completed Tasks",
                    count: 13,
                  ),

                  CountCardWidget(
                    color: const Color.fromARGB(255, 245, 143, 143),
                    title: "Uncompleted Tasks",
                    count: 7,
                  ),

                  SizedBox(height: 300),
                ],
              );
            }
            return LoadingWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: CircleBorder(),
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
            icon: Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 245, 143, 143),
              size: 25,
            ),
          ),
        ],
      ),
      body: BlocListener<HabitCubit, HabitState>(
        listener: (context, state) {
          context.hideLoading();
          if (state is HabitLoadingState) {
            context.showLoading();
          }
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
            if (state is HabitIsEmptyState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/Animations/empty ghost.json',
                      height: 300,
                    ),

                    Text(
                      "Start a new habit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGreen,
                        letterSpacing: 0.5,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Track your daily habits",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else if (state is HabitSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Your habits for today\n$todayDate",
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreen,
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
                                            color: AppColors.darkGreen,
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
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
