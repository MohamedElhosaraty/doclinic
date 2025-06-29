import 'package:doclinic/feature/home/data/data_sources/appointment_data_sources_impl.dart';
import 'package:doclinic/feature/home/data/data_sources/filter_data_sources_impl.dart';
import 'package:doclinic/feature/home/data/repo/appointment_repo_impl.dart';
import 'package:doclinic/feature/home/data/repo/filter_repo_impl.dart';
import 'package:doclinic/feature/home/domain/repositories/appointment_repo.dart';
import 'package:doclinic/feature/home/domain/repositories/search_repo.dart';
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
import '../../feature/home/data/data_sources/appointment_data_sources.dart';
import '../../feature/home/data/data_sources/filter_data_sources.dart';
import '../../feature/home/data/data_sources/home_data_sources.dart';
import '../../feature/home/data/data_sources/home_data_sources_impl.dart';
import '../../feature/home/data/data_sources/search_data_sources.dart';
import '../../feature/home/data/data_sources/search_data_sources_impl.dart';
import '../../feature/home/data/repo/home_repo_impl.dart';
import '../../feature/home/data/repo/search_repo_impl.dart';
import '../../feature/home/domain/repositories/filter_repo.dart';
import '../../feature/home/domain/repositories/home_repo.dart';
import '../../feature/home/domain/usecase/appointment_usecase.dart';
import '../../feature/home/domain/usecase/filter_usecase.dart';
import '../../feature/home/domain/usecase/home_usecase.dart';
import '../../feature/home/domain/usecase/search_usecase.dart';
import '../../feature/home/presentation/cubit/appointment_cubit/appointment_cubit.dart';
import '../../feature/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import '../../feature/home/presentation/cubit/home_cubit/home_cubit.dart';
import '../../feature/home/presentation/cubit/search_cubit/search_cubit.dart';
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

  getIt.registerLazySingleton<SearchDataSources>(
    () => SearchDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<FilterDataSources>(
    () => FilterDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<AppointmentDataSources>(
    () => AppointmentDataSourcesImpl(getIt<ApiManager>()),
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

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(getIt<SearchDataSources>()),
  );

  getIt.registerLazySingleton<FilterRepo>(
    () => FilterRepoImpl(getIt<FilterDataSources>()),
  );

  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(getIt<AppointmentDataSources>()),
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

  getIt.registerLazySingleton<SearchUsecase>(
    () => SearchUsecase(getIt<SearchRepo>()),
  );

  getIt.registerLazySingleton<FilterUsecase>(
    () => FilterUsecase(getIt<FilterRepo>()),
  );

  getIt.registerLazySingleton<AppointmentUsecase>(
    () => AppointmentUsecase(getIt<AppointmentRepo>()),
  );

  // 🧠 Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUsecase>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpUsecase>()));

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt<HomeUsecase>()),
  );

  getIt.registerLazySingleton<SearchCubit>(
    () => SearchCubit(getIt<SearchUsecase>()),
  );

  getIt.registerLazySingleton<FilterCubit>(
    () => FilterCubit(getIt<FilterUsecase>()),
  );

  getIt.registerLazySingleton<AppointmentCubit>(
    () => AppointmentCubit(getIt<AppointmentUsecase>()),
  );
}
