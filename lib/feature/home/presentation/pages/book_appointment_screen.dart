import 'package:doclinic/feature/home/presentation/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../domain/entities/home_entity.dart';
import '../widgets/book_appointment_screen_body.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key, required this.doctorList});

  final DoctorListEntity doctorList;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppointmentCubit>(),
      child: Scaffold(
        body: SafeArea(child: BookAppointmentScreenBody(
          doctorList: doctorList,
        )),
      ),
    );
  }
}
