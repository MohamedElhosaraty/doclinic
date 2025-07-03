import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/my_appointment/domain/entities/my_appointment_entity.dart';

import '../../domain/repositories/my_appointment_repo.dart';
import '../data_sources/my_appointment_data_sources.dart';

class MyAppointmentRepoImpl implements MyAppointmentRepo{

  final MyAppointmentDataSources myAppointmentDataSources;
  MyAppointmentRepoImpl( this.myAppointmentDataSources);

  @override
  Future<Either<Failures, MyAppointmentEntity>> getMyAppointments() async {
    return await myAppointmentDataSources.getMyAppointments();
  }
}