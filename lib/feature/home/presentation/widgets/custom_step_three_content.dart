import 'package:doclinic/feature/home/presentation/widgets/doctor_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../domain/entities/home_entity.dart';

class CustomStepThreeContent extends StatelessWidget {
  const CustomStepThreeContent({super.key, required this.doctorList, required this.selectedDate, required this.selectedTime});

  final DoctorListEntity doctorList;
  final DateTime selectedDate ;
  final String? selectedTime ;



  @override
  Widget build(BuildContext context) {

    DateTime date = DateTime.parse(selectedDate.toString());

    String formatted = DateFormat('EEEE, dd MMMM yyyy').format(date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Booking Information",
          style: AppTextStyles.font18SemiBold(context).copyWith(color: AppColors.dartBlue),
        ),
        24.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.moreLightBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.calendar_month,
                color: AppColors.primaryColor,
              ),
            ),
            15.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date & Time",
                  style: AppTextStyles.font14Bold(context).copyWith(color: AppColors.black),
                ),
                4.verticalSpace,
                Text(
                  formatted,
                  style: AppTextStyles.font12Regular(context).copyWith(color: AppColors.grey),
                ),
                4.verticalSpace,
                Text(
                  selectedTime.toString(),
                  style: AppTextStyles.font12Regular(context).copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
        16.verticalSpace,
        Divider(
          thickness: 1,
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Price : ",
              style: AppTextStyles.font18Bold(context).copyWith(color: AppColors.black),
            ),
            Text(
              "${doctorList.price} \$",
              style: AppTextStyles.font18Bold(context).copyWith(color: AppColors.moreGrey),
            ),
          ],
        ),
        16.verticalSpace,
        Divider(
          thickness: 1,
        ),
        32.verticalSpace,
        Text(
          "Doctor Information",
          style: AppTextStyles.font18SemiBold(context).copyWith(color: AppColors.dartBlue),
        ),
        16.verticalSpace,
        DoctorListViewItem(
            doctorList: doctorList),
      ],
    );
  }
}
