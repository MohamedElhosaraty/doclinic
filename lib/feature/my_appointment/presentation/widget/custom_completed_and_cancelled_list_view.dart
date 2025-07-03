import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/my_appointment_cubit.dart';
import 'custom_completed_and_cancelled_item.dart';

class CustomCompletedAndCancelledListView extends StatelessWidget {
  const CustomCompletedAndCancelledListView({super.key,  this.isCancelled = false,});

  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: isCancelled ? context.read<MyAppointmentCubit>().cancelMyAppointments.length : context.read<MyAppointmentCubit>().doneMyAppointments.length,
      itemBuilder: (context, index) {
        return CustomCompletedAndCancelledItem(
          isCancelled: isCancelled,
          dataEntity: isCancelled ? context.read<MyAppointmentCubit>().cancelMyAppointments[index] : context.read<MyAppointmentCubit>().doneMyAppointments[index],
        );
      },
    );
  }
}
