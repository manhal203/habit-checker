// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit/features/login/data/datasources/login_remote_data_source.dart'
    as _i150;
import 'package:habit/features/login/data/repositories/login_repository_data.dart'
    as _i619;
import 'package:habit/features/login/domain/repositories/login_repository_domain.dart'
    as _i834;
import 'package:habit/features/login/domain/use_cases/login_use_case.dart'
    as _i59;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogin({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i150.BaseLoginRemoteDataSource>(
      () => _i150.LoginRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i834.LoginRepositoryDomain>(
      () => _i619.LoginRepositoryData(gh<_i150.BaseLoginRemoteDataSource>()),
    );
    gh.lazySingleton<_i59.LoginUseCase>(
      () => _i59.LoginUseCase(gh<_i834.LoginRepositoryDomain>()),
    );
    return this;
  }
}
