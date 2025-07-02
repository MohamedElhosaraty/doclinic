import 'package:doclinic/feature/my_appointment_screen/presentation/widget/appointment_app_bar.dart';
import 'package:doclinic/feature/my_appointment_screen/presentation/widget/custom_upcoming_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppointmentAppBar(),
                34.verticalSpace,
                TabBar(
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: AppTextStyles.font14Bold(context),
                  indicatorColor: AppColors.primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ],
                ),
                30.verticalSpace,
                Expanded(
                  child:  TabBarView(
                    children: [
                      const CustomUpcomingListView(),
                      Center(child: Text('Completed')),
                      Center(child: Text('Cancelled')),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
