import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/core/errors/network_exceptions.dart';

abstract class BaseHabitRemoteDataSource {
  Future<List<HabitModel>> getHabit();
}

@LazySingleton(as: BaseHabitRemoteDataSource)
class HabitRemoteDataSource implements BaseHabitRemoteDataSource {
  final SupabaseClient _supabase;
  HabitRemoteDataSource(this._supabase);

  @override
  Future<List<HabitModel>> getHabit() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from("habits")
          .select("*,habit_logs(*)")
          .eq("user_id", userId);
      return response.map((item) => HabitModel.fromJson(item)).toList();
    } catch (error) {
      print(error);
      throw FailureExceptions.getException(error);
    }
  }
}
