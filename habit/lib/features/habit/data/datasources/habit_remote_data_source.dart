import 'package:habit/core/extensions/string_extensions.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/core/errors/network_exceptions.dart';

abstract class BaseHabitRemoteDataSource {
  Future<List<HabitModel>> getHabit();
  Future<bool> doneHabit({required String habitId, required bool isCompleted});
}

@LazySingleton(as: BaseHabitRemoteDataSource)
class HabitRemoteDataSource implements BaseHabitRemoteDataSource {
  final SupabaseClient _supabase;
  HabitRemoteDataSource(this._supabase);

  @override
  Future<List<HabitModel>> getHabit() async {
    try {
      final userId = _supabase.auth.currentUser!.id;

      // final habits = await _supabase
      //     .from("habits")
      //     .select("*")
      //     .eq("user_id", userId);
      // for (var habit in habits) {
      //   await _supabase.from("habit_logs").upsert({
      //     "habit_id": habit["id"],
      //     "is_completed": false,
      //   });
      // }

      final response = await _supabase
          .from("habits")
          .select("*,habit_logs(*)")
          .eq("user_id", userId);

      return response.map((item) => HabitModel.fromJson(item)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> doneHabit({
    required String habitId,
    required bool isCompleted,
  }) async {
    try {
      await _supabase
          .from("habit_logs")
          .update({"is_completed": isCompleted})
          .eq('habit_id', habitId);

      return true;
    } catch (error) {
      print(error);
      throw FailureExceptions.getException(error);
    }
  }
}
