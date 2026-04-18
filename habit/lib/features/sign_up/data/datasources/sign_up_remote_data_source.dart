import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({
    required String email,
    required String password,
    required String username,
    required String phone,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;

  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    final dataAuthUser = await _supabase.auth.signUp(
      password: password,
      email: email,
    );

    await _supabase.from('profiles').insert({
      "id": dataAuthUser.user!.id,
      "phone_number": '966$phone',
      "username": username,
      "email": email,
    });

    return true;
  }
}
