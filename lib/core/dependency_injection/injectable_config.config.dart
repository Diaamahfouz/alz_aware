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

import '../../features/questions/presentation/bloc/questions_cubit.dart'
    as _i504;
import '../../features/result_from_image/data/datasources/remote_datasources/result_from_image_remote_datasources.dart'
    as _i821;
import '../../features/result_from_image/data/repositories/result_from_image_repo_impl.dart'
    as _i1072;
import '../../features/result_from_image/domain/repositories/result_from_image_repo.dart'
    as _i958;
import '../../features/result_from_image/domain/usecases/get_pediction_use_case.dart'
    as _i956;
import '../../features/result_from_image/presentation/bloc/result_from_image_cubit.dart'
    as _i350;
import '../api/api_consumer.dart' as _i207;
import '../api/app_interceptor.dart' as _i449;
import '../api/dio_consumer.dart' as _i82;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreInjectableModule = _$CoreInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i504.QuestionsCubit>(() => _i504.QuestionsCubit());
    gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreInjectableModule.secureStorage,
    );
    gh.factory<_i821.ResultFromImageRemoteDataSource>(
      () => _i821.ResultFromImageRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(dio: gh<_i361.Dio>()),
    );
    gh.singleton<_i207.ApiConsumer>(
      () => _i82.DioConsumer(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i958.ResultFromImageRepo>(
      () => _i1072.ResultFromImageRepoImpl(
        gh<_i821.ResultFromImageRemoteDataSource>(),
      ),
    );
    gh.factory<_i956.GetPredictionUseCase>(
      () => _i956.GetPredictionUseCase(
        resultFromImageRepo: gh<_i958.ResultFromImageRepo>(),
      ),
    );
    gh.factory<_i350.ResultFromImageCubit>(
      () => _i350.ResultFromImageCubit(gh<_i956.GetPredictionUseCase>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
