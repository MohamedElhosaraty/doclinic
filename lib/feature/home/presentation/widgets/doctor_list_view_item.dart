import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../domain/entities/home_entity.dart';

class DoctorListViewItem extends StatelessWidget {
  const DoctorListViewItem({super.key, required this.doctorList});

  final DoctorListEntity doctorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: doctorList.image,
            errorWidget:
                (context, url, error) => Image.network(
                  "https://thumbs.dreamstime.com/b/portrait-female-doctor-13060496.jpg",
                  fit: BoxFit.contain,
                  width: 110.w,
                  height: 120.h,
                ),

            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: AppColors.lightGrey,
                highlightColor: AppColors.background,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder:
                (context, imageProvider) => Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.moreLighterGrey,
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorList.nameDoctor,
                  style: AppTextStyles.font18Bold(
                    context,
                  ).copyWith(color: AppColors.dartBlue),
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  "${doctorList.degree} | ${doctorList.phone}",
                  style: AppTextStyles.font12Medium(
                    context,
                  ).copyWith(color: AppColors.grey),
                ),
                5.verticalSpace,
                Text(
                  doctorList.email,
                  style: AppTextStyles.font12Medium(
                    context,
                  ).copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
