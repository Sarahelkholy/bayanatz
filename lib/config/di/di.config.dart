// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasources/home_data_source.dart' as _i426;
import '../../features/home/data/repositories/home_repo_impl.dart' as _i333;
import '../../features/home/domain/repositories/home_repo.dart' as _i1021;
import '../../features/home/domain/usecases/create_dashboard_usecase.dart'
    as _i408;
import '../../features/home/domain/usecases/dashboard_search_use_case.dart'
    as _i148;
import '../../features/home/domain/usecases/filter_use_case.dart' as _i181;
import '../../features/home/domain/usecases/get_dashboards_use_case.dart'
    as _i518;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../module/firebase_module.dart' as _i512;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i426.HomeDataSource>(
      () => _i426.HomeDataSource(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i1021.HomeRepo>(
      () => _i333.HomeRepoImpl(gh<_i426.HomeDataSource>()),
    );
    gh.factory<_i408.CreateDashboardUsecase>(
      () => _i408.CreateDashboardUsecase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i148.DashboardSearchUsecase>(
      () => _i148.DashboardSearchUsecase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i181.FilterDashboardsUsecase>(
      () => _i181.FilterDashboardsUsecase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i518.GetDashboardsUsecase>(
      () => _i518.GetDashboardsUsecase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(
        gh<_i518.GetDashboardsUsecase>(),
        gh<_i408.CreateDashboardUsecase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i512.FirebaseModule {}
