import 'package:doclinic/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';
import '../../domain/entities/home_entity.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_step_three_content.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.doctorList, required this.selectedDate, this.selectedTime});

  final DoctorListEntity doctorList;
  final DateTime selectedDate ;
  final String? selectedTime ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBar(title: "Book Appointment",),
                60.verticalSpace,
                SvgPicture.asset(Assets.svgsTrue),
                21.verticalSpace,
                Text(
                  "Booking Confirmed",
                  style: AppTextStyles.font24Bold(context).copyWith(
                      color: AppColors.dartBlue),
                ),
                56.verticalSpace,
                CustomStepThreeContent(
                  doctorList: doctorList,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                ),
                CustomButton(
                  text: "Done",
                  onPressed: (){
                    context.pushNamedAndRemoveUntil(
                      Routes.homeScreen,
                      predicate: (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
