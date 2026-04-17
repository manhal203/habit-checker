// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit/features/habit/data/datasources/habit_remote_data_source.dart'
    as _i364;
import 'package:habit/features/habit/data/repositories/habit_repository_data.dart'
    as _i522;
import 'package:habit/features/habit/domain/repositories/habit_repository_domain.dart'
    as _i173;
import 'package:habit/features/habit/domain/use_cases/habit_use_case.dart'
    as _i969;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHabit({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i364.BaseHabitRemoteDataSource>(
      () => _i364.HabitRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i173.HabitRepositoryDomain>(
      () => _i522.HabitRepositoryData(gh<_i364.BaseHabitRemoteDataSource>()),
    );
    gh.lazySingleton<_i969.HabitUseCase>(
      () => _i969.HabitUseCase(gh<_i173.HabitRepositoryDomain>()),
    );
    return this;
  }
}
