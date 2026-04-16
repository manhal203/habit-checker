import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/core/errors/network_exceptions.dart';

abstract class BaseLoginRemoteDataSource {
  Future<void> getLogin({required String email, required String password});
}

@LazySingleton(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
  final SupabaseClient _supabase;

  LoginRemoteDataSource(this._supabase);

  @override
  Future<void> getLogin({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(password: password, email: email);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
