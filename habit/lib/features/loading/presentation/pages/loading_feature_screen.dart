import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/core/extensions/context_extensions.dart';
import 'package:habit/core/navigation/routers.dart';
import 'package:habit/core/widgets/loading_widget.dart';
import 'package:habit/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:habit/features/loading/presentation/cubit/loading_state.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<LoadingCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Loading Feature Screen')),
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          context.hideLoading();

          switch (state) {
            case LoadingCheckingState():
              context.showLoading();
              break;

            case LoadingSuccessState():
              context.go(Routes.habit);
              break;

            default:
            context.go(Routes.login);
          }
        },
        child: LoadingWidget()
      ),
    );
  }
}
