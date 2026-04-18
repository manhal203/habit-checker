import 'package:habit/core/common/models/user_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  UserModel? _user;

  set setUser(UserModel user) {
    _user = user;
  }

  UserModel? get getUser {
    return _user;
  }
}
