import 'package:habit/core/utils/formatters.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/core/errors/network_exceptions.dart';

abstract class BaseHabitRemoteDataSource {
  Future<List<HabitModel>> getHabit();
  Future<bool> doneHabit({required String habitId, required bool isCompleted});
  Future<bool> deleteHabit({required String habitId});
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
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> doneHabit({
    required String habitId,
    required bool isCompleted,
  }) async {
    try {
      final today = Formatters.formatDate(DateTime.now());
      final existingLog = await _supabase
          .from("habit_logs")
          .select()
          .eq("habit_id", habitId)
          .eq("log_date", today)
          .maybeSingle();

      if (existingLog == null) {
        await _supabase.from('habit_logs').insert({
          "habit_id": habitId,
          "log_date": today,
          "is_completed": isCompleted,
        });
      } else {
        await _supabase
            .from('habit_logs')
            .update({"is_completed": isCompleted})
            .eq("id", existingLog['id']);
      }

      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> deleteHabit({required String habitId}) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase
          .from("habits")
          .delete()
          .eq("user_id", userId)
          .eq("id", habitId);

      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
