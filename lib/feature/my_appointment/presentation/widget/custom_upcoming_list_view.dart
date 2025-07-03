import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/my_appointment_cubit.dart';
import 'custom_upcoming_item.dart';

class CustomUpcomingListView extends StatelessWidget {
  const CustomUpcomingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: context.watch<MyAppointmentCubit>().allMyAppointments.length,
      itemBuilder: (context, index) {
        return CustomUpcomingItem(
          dataEntity:  context.watch<MyAppointmentCubit>().allMyAppointments[index],
        );
      },
    );
  }
}
