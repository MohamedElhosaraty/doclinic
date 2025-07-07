import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../cubit/filter_cubit/filter_cubit.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key,required this.cityEntity});

  final List<Map<String, dynamic>> cityEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          55.verticalSpace,
          Text(
            "Sort By",
            style: AppTextStyles.font18SemiBold(context).copyWith(
              color: AppColors.dartBlue
            ),),
          16.verticalSpace,
          Divider(
            thickness: 1,),
          33.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Speciality",
              style: AppTextStyles.font16Medium(context).copyWith(
                color: AppColors.dartBlue
              ),),
          ),
          24.verticalSpace,
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              shrinkWrap: true  ,
              itemCount: cityEntity.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  context.read<FilterCubit>().changeIndex(index);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                  margin: const EdgeInsets.only(right: 12.0,),
                  decoration: BoxDecoration(
                      color: context.watch<FilterCubit>().currentIndex == index ? AppColors.primaryColor : AppColors.moreLightGrey,
                      borderRadius: BorderRadius.circular(24.0)
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    cityEntity[index]["cityName"],
                    style: AppTextStyles.font16Medium(context).copyWith(
                        color: context.watch<FilterCubit>().currentIndex == index ? AppColors.background : AppColors.lightGrey
                    ),),
                ),
              ),
            ),
          ),
          48.verticalSpace,
          CustomButton(
            onPressed: (){
              context.pop();
              context.read<FilterCubit>().getFilterData(cityEntity[context.read<FilterCubit>().currentIndex]["cityId"]);
            },
            child: Text(
              "Done",
              style: AppTextStyles.font16SemiBold(context).copyWith(
                  color: AppColors.background
              ),),
          ),
          40.verticalSpace,
        ],
      ),
    );
  }
}
