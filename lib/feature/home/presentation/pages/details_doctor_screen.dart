import 'package:flutter/material.dart';

import '../../domain/entities/home_entity.dart';
import '../widgets/details_doctor_screen_body.dart';

class DetailsDoctorScreen extends StatelessWidget {
  const DetailsDoctorScreen({super.key,required this.doctorListEntity});

  final DoctorListEntity doctorListEntity;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: DetailsDoctorScreenBody(
            doctorList: doctorListEntity,
          ),
        ),
      ),
    );
  }
}
