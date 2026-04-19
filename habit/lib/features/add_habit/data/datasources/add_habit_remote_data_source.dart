import 'package:habit/core/services/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/core/errors/network_exceptions.dart';

abstract class BaseAddHabitRemoteDataSource {
  Future<bool> getAddHabit({
    required String title,
    required String description,
  });
}

@LazySingleton(as: BaseAddHabitRemoteDataSource)
class AddHabitRemoteDataSource implements BaseAddHabitRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _currentUser;

  AddHabitRemoteDataSource(this._supabase, this._currentUser);

  @override
  Future<bool> getAddHabit({
    required String title,
    required String description,
  }) async {
    try {
      final userId = _currentUser.getUser!.id;

      await _supabase.from("habits").insert({
        "user_id": userId,
        "title": title,
        "description": description,
      }).select();

      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
