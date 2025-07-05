import 'package:doclinic/feature/profile_screen/presentation/widget/custom_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../widget/custom_profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: AppColors.primaryColor,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomProfileAppBar()),
              Positioned(
                top:  190.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),
                  ),
                ),
              ),
              Positioned(
                    top: 90.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CustomProfileBody(),
                  ),

            ],
          ),
        ),
    );
  }
}
