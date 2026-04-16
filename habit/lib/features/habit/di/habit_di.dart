import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'habit_di.config.dart'; 

@InjectableInit(
  initializerName: 'initHabit',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/habit'],
)
void configureHabit(GetIt getIt) {
  getIt.initHabit();
}
