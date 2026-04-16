import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'login_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLogin',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/login'],
)
void configureLogin(GetIt getIt) {
  getIt.initLogin();
}
