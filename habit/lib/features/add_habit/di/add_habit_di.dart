import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_habit_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddHabit',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/add_habit'],
)
void configureAddHabit(GetIt getIt) {
  getIt.initAddHabit();
}
