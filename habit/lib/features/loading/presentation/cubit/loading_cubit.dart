import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/features/loading/domain/use_cases/loading_use_case.dart';
import 'package:habit/features/loading/presentation/cubit/loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  final LoadingUseCase _loadingUseCase;

  LoadingCubit(this._loadingUseCase) : super(LoadingInitialState());

  Future<void> getLoadingMethod() async {
    final result = await _loadingUseCase.getLoading();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
