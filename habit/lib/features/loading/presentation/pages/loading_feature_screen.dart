import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/loading/presentation/cubit/loading_cubit.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<LoadingCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Loading Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
