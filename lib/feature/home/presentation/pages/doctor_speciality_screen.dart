import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../domain/entities/home_entity.dart';
import '../widgets/custom_app_bar.dart';

class DoctorSpecialityScreen extends StatelessWidget {
  const DoctorSpecialityScreen({super.key, required this.homeEntity});

  final HomeEntity homeEntity;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 18),
          child: Column(
            children: [
              const CustomAppBar(title: "Doctor Speciality",),
              42.verticalSpace,
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeEntity.specializationList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    return  Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.lightBlue,
                          child: Image.asset(Assets.imagesHomeDoctorSpeciality,fit: BoxFit.cover,
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                        8.verticalSpace,
                        Text(
                          homeEntity.specializationList[index].nameSpecialization,
                          style: AppTextStyles.font12Regular(context).copyWith(
                              color: AppColors.block)
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
