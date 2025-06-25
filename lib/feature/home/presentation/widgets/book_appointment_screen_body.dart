import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/home_entity.dart';
import 'custom_app_bar.dart';
import 'custom_stepper.dart';

class BookAppointmentScreenBody extends StatelessWidget {
  const BookAppointmentScreenBody({super.key, required this.doctorList});

  final DoctorListEntity doctorList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          children: [
            const CustomAppBar(title: "Book Appointment",),
            32.verticalSpace,
            Expanded(
                child: CustomStepper(
                  doctorList: doctorList,
                )),
          ],),
    );
  }
}
