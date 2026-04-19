import 'package:habit/core/common/models/user_model.dart';
import 'package:habit/core/services/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit/features/loading/data/models/loading_model.dart';
import 'package:habit/core/errors/network_exceptions.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<LoadingModel> getLoading();
}

@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _currentUser;

  LoadingRemoteDataSource(this._currentUser, this._supabase);

  @override
  Future<LoadingModel> getLoading() async {
    try {
      final userToken = _supabase.auth.currentSession?.accessToken;
      final isUser = userToken != null;
      final isExpired = _supabase.auth.currentSession?.isExpired ?? true;

      if (isUser && !isExpired) {
        final userProfile = await _supabase
            .from("profiles")
            .select()
            .eq("id", _supabase.auth.currentUser!.id)
            .single();

        final UserModel user = UserModel.fromJson(userProfile);

        _currentUser.setUser = user;

        return LoadingModel(isLogin: true);
      }

      return LoadingModel(isLogin: false);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
