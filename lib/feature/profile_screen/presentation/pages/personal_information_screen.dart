import 'package:doclinic/core/di/dependency_injection.dart';
import 'package:doclinic/feature/profile_screen/presentation/widget/custom_personal_information_builder.dart';
import 'package:doclinic/feature/profile_screen/presentation/widget/custom_setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/assets.dart';
import '../cubit/up_date_personal_information_cubit/up_date_personal_information_cubit.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpDatePersonalInformationCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomSettingAppBar(
                    paddingLeft: MediaQuery
                        .of(context)
                        .size
                        .width * .12,
                    title: "Personal Information",
                  ),
                  48.verticalSpace,
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        Assets.imagesProfile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  51.verticalSpace,
                  const CustomPersonalInformationBuilder(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
