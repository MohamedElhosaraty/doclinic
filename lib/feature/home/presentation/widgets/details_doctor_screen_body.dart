import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:doclinic/feature/home/presentation/widgets/doctor_list_view_item.dart';
import 'package:doclinic/feature/home/presentation/widgets/location_tab_bar.dart';
import 'package:doclinic/feature/home/presentation/widgets/price_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/home_entity.dart';
import 'about_tab_bar.dart';

class DetailsDoctorScreenBody extends StatelessWidget {
  const DetailsDoctorScreenBody({super.key, required this.doctorList});

  final DoctorListEntity doctorList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          CustomAppBar(
            title: doctorList.nameDoctor , isActionButton: true,),
          32.verticalSpace,
          DoctorListViewItem(doctorList: doctorList),
          24.verticalSpace,
          TabBar(
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: AppTextStyles.font14Bold(context),
            indicatorColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'About'),
              Tab(text: 'Location'),
              Tab(text: 'price'),
            ],
          ),
          Expanded(
              child:  TabBarView(
                children: [
                  AboutTabBar(
                     doctorList: doctorList,
                  ),
                  LocationTabBar(
                      doctorList: doctorList),
                  PriceTabBar(
                    doctorList: doctorList,
                  ),
                ],
              ),
          ),
          25.verticalSpace,
          CustomButton(
              text: "Make An Appointment", onPressed: (){
                context.pushNamed(Routes.bookAppointmentScreen);
          }),

        ],
      ),
    );
  }
}
