import 'package:get_it/get_it.dart';

import '../../feature/auth/data/data_sources/login_data_sources.dart';
import '../../feature/auth/data/data_sources/login_data_sources_impl.dart';
import '../../feature/auth/data/data_sources/sign_up_data_sources.dart';
import '../../feature/auth/data/data_sources/sign_up_data_sources_impl.dart';
import '../../feature/auth/data/repositories/login_repo_impl.dart';
import '../../feature/auth/data/repositories/sign_up_repo_impl.dart';
import '../../feature/auth/domain/repositories/login_repo.dart';
import '../../feature/auth/domain/repositories/sign_up_repo.dart';
import '../../feature/auth/domain/usecase/login_usecase.dart';
import '../../feature/auth/domain/usecase/sign_up_usecase.dart';
import '../../feature/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../feature/home/data/data_sources/home_data_sources.dart';
import '../../feature/home/data/data_sources/home_data_sources_impl.dart';
import '../../feature/home/data/repo/home_repo_impl.dart';
import '../../feature/home/domain/repositories/home_repo.dart';
import '../../feature/home/domain/usecase/home_usecase.dart';
import '../../feature/home/presentation/cubit/home_cubit/home_cubit.dart';
import '../api/api_manager.dart';
import '../api/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 🔧 Core
  getIt.registerLazySingleton<ApiManager>(
    () => ApiManager(dio: DioFactory.getDio()),
  );

  // 📦 Data Sources
  getIt.registerLazySingleton<LoginDataSources>(
    () => LoginDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<SignUpDataSources>(
    () => SignUpDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<HomeDataSources>(
    () => HomeDataSourcesImpl(getIt<ApiManager>()),
  );

  // 📚 Repositories
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt<LoginDataSources>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(getIt<SignUpDataSources>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt<HomeDataSources>()),
  );

  // ✅ Use Cases
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(getIt<LoginRepo>()),
  );

  getIt.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(getIt<SignUpRepo>()),
  );

  getIt.registerLazySingleton<HomeUsecase>(
    () => HomeUsecase(getIt<HomeRepo>()),
  );

  // 🧠 Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUsecase>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpUsecase>()));

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt<HomeUsecase>()),
  );
}
