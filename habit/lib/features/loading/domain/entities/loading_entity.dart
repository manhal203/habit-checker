import 'package:equatable/equatable.dart';

class LoadingEntity extends Equatable {
  final bool isLogin;

  const LoadingEntity({
    required this.isLogin,
  });

  @override
  List<Object?> get props => [isLogin];
}
