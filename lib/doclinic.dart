import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'feature/home/presentation/cubit/filter_cubit/filter_cubit.dart';

class DoClinicApp extends StatelessWidget {
  const DoClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocProvider(
            create: (context) => getIt<FilterCubit>(),

          child: MaterialApp(
            title: 'DoClinic',
            theme: ThemeData(
              primaryColor: Colors.blue,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: isLoggedInUser ? Routes.homeScreen : Routes
                .onBoardingScreen,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ));
  }
}
