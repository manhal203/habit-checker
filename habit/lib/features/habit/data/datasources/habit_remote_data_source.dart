import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/core/services/local_keys_service.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/core/errors/network_exceptions.dart';


abstract class BaseHabitRemoteDataSource {
  Future<HabitModel> getHabit();
}


@LazySingleton(as: BaseHabitRemoteDataSource)
class HabitRemoteDataSource implements BaseHabitRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   HabitRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<HabitModel> getHabit() async {
    try {
      return HabitModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
