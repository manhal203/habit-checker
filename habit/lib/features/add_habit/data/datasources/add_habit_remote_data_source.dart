import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/core/services/local_keys_service.dart';
import 'package:habit/features/add_habit/data/models/add_habit_model.dart';
import 'package:habit/core/errors/network_exceptions.dart';


abstract class BaseAddHabitRemoteDataSource {
  Future<AddHabitModel> getAddHabit();
}


@LazySingleton(as: BaseAddHabitRemoteDataSource)
class AddHabitRemoteDataSource implements BaseAddHabitRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   AddHabitRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<AddHabitModel> getAddHabit() async {
    try {
      return AddHabitModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
