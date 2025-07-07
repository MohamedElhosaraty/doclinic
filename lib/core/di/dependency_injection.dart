import 'package:doclinic/feature/home/data/data_sources/appointment_data_sources_impl.dart';
import 'package:doclinic/feature/home/data/data_sources/filter_data_sources_impl.dart';
import 'package:doclinic/feature/home/data/repo/appointment_repo_impl.dart';
import 'package:doclinic/feature/home/data/repo/filter_repo_impl.dart';
import 'package:doclinic/feature/home/domain/repositories/appointment_repo.dart';
import 'package:doclinic/feature/home/domain/repositories/search_repo.dart';
import 'package:doclinic/feature/my_appointment/data/repo/my_appointment_repo_impl.dart';
import 'package:doclinic/feature/my_appointment/domain/usecase/my_appointment_usecase.dart';
import 'package:doclinic/feature/my_appointment/presentation/cubit/my_appointment_cubit.dart';
import 'package:doclinic/feature/profile_screen/data/data_sources/get_profile_data_sources_impl.dart';
import 'package:doclinic/feature/profile_screen/data/data_sources/up_date_profile_data_sources_impl.dart';
import 'package:doclinic/feature/profile_screen/data/repo/get_profile_repo_impl.dart';
import 'package:doclinic/feature/profile_screen/domain/repositories/get_profile_repo.dart';
import 'package:doclinic/feature/profile_screen/presentation/cubit/personal_information_cubit/personal_information_cubit.dart';
import 'package:doclinic/feature/profile_screen/presentation/cubit/up_date_personal_information_cubit/up_date_personal_information_cubit.dart';
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
import '../../feature/my_appointment/data/data_sources/my_appointment_data_sources.dart';
import '../../feature/my_appointment/data/data_sources/my_appointment_data_sources_impl.dart';
import '../../feature/my_appointment/domain/repositories/my_appointment_repo.dart';
import '../../feature/profile_screen/data/data_sources/get_profile_data_sources.dart';
import '../../feature/profile_screen/data/data_sources/up_date_profile_data_sources.dart';
import '../../feature/profile_screen/data/repo/up_date_profile_repo_impl.dart';
import '../../feature/profile_screen/domain/repositories/up_date_profile_repo.dart';
import '../../feature/profile_screen/domain/usecase/get_profile_usecase.dart';
import '../../feature/profile_screen/domain/usecase/up_date_profile_usecase.dart';
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

  getIt.registerLazySingleton<MyAppointmentDataSources>(
    () => MyAppointmentDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<GetProfileDataSources>(
    () => GetProfileDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<UpDateProfileDataSources>(
    () => UpDateProfileDataSourcesImpl(getIt<ApiManager>()),
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

  getIt.registerLazySingleton<MyAppointmentRepo>(
    () => MyAppointmentRepoImpl(getIt<MyAppointmentDataSources>()),
  );

  getIt.registerLazySingleton<GetProfileRepo>(
    () => GetProfileRepoImpl(getIt<GetProfileDataSources>()),
  );

  getIt.registerLazySingleton<UpDateProfileRepo>(
    () => UpDateProfileRepoImpl(getIt<UpDateProfileDataSources>()),
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

  getIt.registerLazySingleton<MyAppointmentUseCase>(
    () => MyAppointmentUseCase(getIt<MyAppointmentRepo>()),
  );

  getIt.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(getIt<GetProfileRepo>()),
  );

  getIt.registerLazySingleton<UpDateProfileUseCase>(
    () => UpDateProfileUseCase(getIt<UpDateProfileRepo>()),
  );

  // 🧠 Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUsecase>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpUsecase>()));

  getIt.registerFactory<HomeCubit>(
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

  getIt.registerLazySingleton<MyAppointmentCubit>(
    () => MyAppointmentCubit(getIt<MyAppointmentUseCase>()),
  );

  getIt.registerLazySingleton<PersonalInformationCubit>(
    () => PersonalInformationCubit(getIt<GetProfileUseCase>()),
  );

  getIt.registerLazySingleton<UpDatePersonalInformationCubit>(
    () => UpDatePersonalInformationCubit(getIt<UpDateProfileUseCase>()),
  );
}
