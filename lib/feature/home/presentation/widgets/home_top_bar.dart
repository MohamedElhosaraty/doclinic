import 'package:doclinic/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../profile_screen/presentation/cubit/personal_information_cubit/personal_information_cubit.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<PersonalInformationCubit, PersonalInformationState>(
              builder: (context, state) {
                if (state is PersonalInformationLoading) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 24.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                }
                return Text(
                  "Hi, ${context.read<PersonalInformationCubit>().name} !",
                  style: AppTextStyles.font18Bold(
                    context,
                  ).copyWith(color: AppColors.dartBlue),
                );
              },
            ),
            Text(
              "How Are you Today?",
              style: AppTextStyles.font12Regular(
                context,
              ).copyWith(color: AppColors.grey),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.moreLighterGrey,
          child: SvgPicture.asset(Assets.svgsNotification),
        ),
      ],
    );
  }
}
