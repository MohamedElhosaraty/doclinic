import 'package:doclinic/core/routing/routes.dart';
import 'package:doclinic/feature/auth/presentation/page/sign_up_screen.dart';
import 'package:doclinic/feature/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/auth/presentation/page/login_screen.dart';
import '../../feature/home/domain/entities/home_entity.dart';
import '../../feature/home/presentation/cubit/search_cubit/search_cubit.dart';
import '../../feature/home/presentation/pages/book_appointment_screen.dart';
import '../../feature/home/presentation/pages/details_doctor_screen.dart';
import '../../feature/home/presentation/pages/doctor_speciality_screen.dart';
import '../../feature/home/presentation/pages/recommendation_doctor_screen.dart';
import '../../feature/onboarding/pages/onboarding_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.doctorSpecialityScreen:
        return MaterialPageRoute(
          builder:
              (_) => DoctorSpecialityScreen(
                homeEntity: settings.arguments as HomeEntity,
              ),
        );

      case Routes.recommendationDoctorScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SearchCubit>(),
                child: RecommendationDoctorScreen(
                  cityEntity: args['cityEntity'] as List<Map<String, dynamic>>,
                  doctorList: args['doctorList'] as List<DoctorListEntity>,
                ),
              ),
        );

      case Routes.detailsDoctorScreen:
        return MaterialPageRoute(
          builder:
              (_) => DetailsDoctorScreen(
                doctorListEntity: settings.arguments as DoctorListEntity,
              ),
        );

      case Routes.bookAppointmentScreen:
        return MaterialPageRoute(builder: (_) =>  BookAppointmentScreen(
          doctorList: settings.arguments as DoctorListEntity,
        ));
    }
    return null;
  }
}
