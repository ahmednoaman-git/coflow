// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/authentication/data/datasources/auth_remote_datasource.dart'
    as _i14;
import '../../features/authentication/data/datasources/datasources.dart'
    as _i748;
import '../../features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i195;
import '../../features/authentication/domain/domain.dart' as _i22;
import '../../features/authentication/domain/repositories/repositories.dart'
    as _i625;
import '../../features/authentication/domain/use_cases/login_use_case.dart'
    as _i146;
import '../../features/authentication/domain/use_cases/logout_use_case.dart'
    as _i168;
import '../../features/authentication/domain/use_cases/register_use_case.dart'
    as _i150;
import '../../features/authentication/domain/use_cases/resend_otp_use_case.dart'
    as _i460;
import '../../features/authentication/domain/use_cases/send_otp_use_case.dart'
    as _i339;
import '../../features/authentication/domain/use_cases/verify_otp_use_case.dart'
    as _i121;
import '../../features/authentication/presentation/state/login_cubit.dart'
    as _i1017;
import '../../features/authentication/presentation/state/register_cubit.dart'
    as _i1040;
import '../../features/home/data/datasources/datasources.dart' as _i1067;
import '../../features/home/data/datasources/home_remote_datasource.dart'
    as _i278;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/use_cases/get_home_use_case.dart' as _i261;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/splash/presentation/state/splash_cubit.dart' as _i315;
import '../caching/cache_client.dart' as _i1035;
import '../core.dart' as _i351;
import '../data/auth/auth_state_manager.dart' as _i224;
import '../l10n/localization_cubit/localization_cubit.dart' as _i724;
import '../l10n/localization_manager.dart' as _i128;
import '../network/dio_client.dart' as _i667;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i745.AuthInterceptor>(() => _i745.AuthInterceptor());
    await gh.lazySingletonAsync<_i1035.CacheClient>(() {
      final i = _i1035.CacheClient();
      return i.init().then((_) => i);
    }, preResolve: true);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i128.LocalizationManager>(
      () => _i128.LocalizationManager(gh<_i460.SharedPreferences>()),
    );
    await gh.lazySingletonAsync<_i224.AuthStateManager>(() {
      final i = _i224.AuthStateManager(gh<_i1035.CacheClient>());
      return i.init().then((_) => i);
    }, preResolve: true);
    gh.factory<_i315.SplashCubit>(
      () => _i315.SplashCubit(gh<_i224.AuthStateManager>()),
    );
    gh.singleton<_i724.LocalizationCubit>(
      () => _i724.LocalizationCubit(gh<_i128.LocalizationManager>()),
    );
    gh.lazySingleton<_i667.DioClient>(
      () => registerModule.dioClient(gh<_i745.AuthInterceptor>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i14.AuthRemoteDataSource>(
      () => _i14.AuthRemoteDataSource(gh<_i351.DioClient>()),
    );
    gh.lazySingleton<_i278.HomeRemoteDataSource>(
      () => _i278.HomeRemoteDataSource(gh<_i351.DioClient>()),
    );
    gh.lazySingleton<_i0.HomeRepository>(
      () => _i76.HomeRepositoryImpl(gh<_i1067.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i625.AuthenticationRepository>(
      () => _i195.AuthenticationRepositoryImpl(
        gh<_i748.AuthRemoteDataSource>(),
        gh<_i351.AuthStateManager>(),
      ),
    );
    gh.lazySingleton<_i261.GetHomeUseCase>(
      () => _i261.GetHomeUseCase(gh<_i0.HomeRepository>()),
    );
    gh.lazySingleton<_i146.LoginUseCase>(
      () => _i146.LoginUseCase(gh<_i625.AuthenticationRepository>()),
    );
    gh.lazySingleton<_i168.LogoutUseCase>(
      () => _i168.LogoutUseCase(gh<_i625.AuthenticationRepository>()),
    );
    gh.lazySingleton<_i150.RegisterUseCase>(
      () => _i150.RegisterUseCase(gh<_i625.AuthenticationRepository>()),
    );
    gh.lazySingleton<_i460.ResendOtpUseCase>(
      () => _i460.ResendOtpUseCase(gh<_i625.AuthenticationRepository>()),
    );
    gh.lazySingleton<_i339.SendOtpUseCase>(
      () => _i339.SendOtpUseCase(gh<_i625.AuthenticationRepository>()),
    );
    gh.lazySingleton<_i121.VerifyOtpUseCase>(
      () => _i121.VerifyOtpUseCase(gh<_i625.AuthenticationRepository>()),
    );
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i261.GetHomeUseCase>()));
    gh.factory<_i1040.RegisterCubit>(
      () => _i1040.RegisterCubit(
        gh<_i22.RegisterUseCase>(),
        gh<_i22.SendOtpUseCase>(),
        gh<_i22.VerifyOtpUseCase>(),
      ),
    );
    gh.factory<_i1017.LoginCubit>(
      () => _i1017.LoginCubit(gh<_i22.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
