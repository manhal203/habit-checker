// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit/features/sign_up/data/datasources/sign_up_remote_data_source.dart'
    as _i243;
import 'package:habit/features/sign_up/data/repositories/sign_up_repository_data.dart'
    as _i345;
import 'package:habit/features/sign_up/domain/repositories/sign_up_repository_domain.dart'
    as _i279;
import 'package:habit/features/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i365;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSignUp({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i243.BaseSignUpRemoteDataSource>(
      () => _i243.SignUpRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i279.SignUpRepositoryDomain>(
      () => _i345.SignUpRepositoryData(gh<_i243.BaseSignUpRemoteDataSource>()),
    );
    gh.lazySingleton<_i365.SignUpUseCase>(
      () => _i365.SignUpUseCase(gh<_i279.SignUpRepositoryDomain>()),
    );
    return this;
  }
}
