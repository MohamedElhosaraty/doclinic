import 'package:doclinic/core/di/dependency_injection.dart';
import 'package:doclinic/feature/home/presentation/widgets/doctor_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit/home_cubit.dart';
import '../widgets/doctor_blue_container.dart';
import '../widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHomeData(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopBar(),
                const DoctorBlueContainer(),
                24.verticalSpace,
                 DoctorBlocBuilder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}