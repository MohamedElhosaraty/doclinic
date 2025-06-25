import 'package:flutter/material.dart';

import '../../domain/entities/home_entity.dart';
import '../widgets/book_appointment_screen_body.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key, required this.doctorList});

  final DoctorListEntity doctorList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookAppointmentScreenBody(
        doctorList: doctorList,
      )),
    );
  }
}
