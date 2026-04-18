// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit/core/services/user_service.dart' as _i719;
import 'package:habit/features/add_habit/data/datasources/add_habit_remote_data_source.dart'
    as _i283;
import 'package:habit/features/add_habit/data/repositories/add_habit_repository_data.dart'
    as _i755;
import 'package:habit/features/add_habit/domain/repositories/add_habit_repository_domain.dart'
    as _i617;
import 'package:habit/features/add_habit/domain/use_cases/add_habit_use_case.dart'
    as _i737;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddHabit({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i283.BaseAddHabitRemoteDataSource>(
      () => _i283.AddHabitRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i719.UserService>(),
      ),
    );
    gh.lazySingleton<_i617.AddHabitRepositoryDomain>(
      () => _i755.AddHabitRepositoryData(
        gh<_i283.BaseAddHabitRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i737.AddHabitUseCase>(
      () => _i737.AddHabitUseCase(gh<_i617.AddHabitRepositoryDomain>()),
    );
    return this;
  }
}
