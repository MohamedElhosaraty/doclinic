import 'package:doclinic/feature/my_appointment/presentation/widget/appointment_app_bar.dart';
import 'package:doclinic/feature/my_appointment/presentation/widget/custom_completed_and_cancelled_list_view.dart';
import 'package:doclinic/feature/my_appointment/presentation/widget/custom_upcoming_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../cubit/my_appointment_cubit.dart';
import '../widget/my_appointment_shimmer_loading.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0,right: 16 ,left: 16),
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
                child: BlocBuilder<MyAppointmentCubit, MyAppointmentState>(
                  builder: (context, state) {
                    if (state is MyAppointmentLoading) {
                      return const MyAppointmentShimmerLoading();
                    }else if (state is MyAppointmentError) {
                      return Center(child: Text(state.error.toString()));
                    }else if (state is MyAppointmentSuccess) {
                      return TabBarView(
                        children: [
                          const CustomUpcomingListView(),
                          const CustomCompletedAndCancelledListView(),
                          const CustomCompletedAndCancelledListView(
                            isCancelled: true,
                          ),
                        ],
                      );
                    }
                    return SizedBox.shrink();
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
