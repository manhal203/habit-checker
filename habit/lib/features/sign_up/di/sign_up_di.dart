import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'sign_up_di.config.dart'; 

@InjectableInit(
  initializerName: 'initSignUp',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sign_up'],
)
void configureSignUp(GetIt getIt) {
  getIt.initSignUp();
}
