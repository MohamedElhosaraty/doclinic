import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/home/domain/entities/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'doctor_list_view_item.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.doctorList, });

  final List<DoctorListEntity> doctorList ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${doctorList.length} founds",
            style: AppTextStyles.font18SemiBold(context).copyWith(
              color: AppColors.dartBlue,
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    context.pushNamed(Routes.detailsDoctorScreen , arguments: doctorList[index]);
                  },
                  child: DoctorListViewItem(
                    doctorList: doctorList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
