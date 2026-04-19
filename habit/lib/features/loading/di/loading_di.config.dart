// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit/core/services/local_keys_service.dart' as _i841;
import 'package:habit/features/loading/data/datasources/loading_remote_data_source.dart'
    as _i283;
import 'package:habit/features/loading/data/repositories/loading_repository_data.dart'
    as _i2;
import 'package:habit/features/loading/domain/repositories/loading_repository_domain.dart'
    as _i313;
import 'package:habit/features/loading/domain/use_cases/loading_use_case.dart'
    as _i491;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoading({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i283.BaseLoadingRemoteDataSource>(
      () => _i283.LoadingRemoteDataSource(
        gh<_i841.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i313.LoadingRepositoryDomain>(
      () => _i2.LoadingRepositoryData(gh<_i283.BaseLoadingRemoteDataSource>()),
    );
    gh.lazySingleton<_i491.LoadingUseCase>(
      () => _i491.LoadingUseCase(gh<_i313.LoadingRepositoryDomain>()),
    );
    return this;
  }
}
