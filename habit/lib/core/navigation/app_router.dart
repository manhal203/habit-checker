import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/login/presentation/pages/login_feature_screen.dart';
import 'package:habit/features/login/presentation/cubit/login_cubit.dart';
import 'package:habit/features/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:habit/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:habit/features/add_habit/presentation/pages/add_habit_feature_screen.dart';
import 'package:habit/features/add_habit/presentation/cubit/add_habit_cubit.dart';
import 'package:habit/features/habit/presentation/pages/habit_feature_screen.dart';
import 'package:habit/features/habit/presentation/cubit/habit_cubit.dart';
import 'package:habit/features/loading/presentation/pages/loading_feature_screen.dart';
import 'package:habit/features/loading/presentation/cubit/loading_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loading,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.addHabit,
        builder: (context, state) => BlocProvider(
          create: (context) => AddHabitCubit(GetIt.I.get()),
          child: const AddHabitFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.habit,
        builder: (context, state) => BlocProvider(
          create: (context) => HabitCubit(GetIt.I.get()),
          child: const HabitFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.loading,
        builder: (context, state) => BlocProvider(
          create: (context) => LoadingCubit(GetIt.I.get()),
          child: const LoadingFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
