import 'package:get_it/get_it.dart';
import 'package:habit/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:habit/features/login/di/login_di.dart';
import 'package:habit/features/sign_up/di/sign_up_di.dart';
import 'package:habit/features/add_habit/di/add_habit_di.dart';
import 'package:habit/features/habit/di/habit_di.dart';
import 'package:habit/features/loading/di/loading_di.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib/core'],
)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
  configureLogin(getIt);
  configureSignUp(getIt);
  configureAddHabit(getIt);
  configureHabit(getIt);
    configureLoading(getIt);
}
