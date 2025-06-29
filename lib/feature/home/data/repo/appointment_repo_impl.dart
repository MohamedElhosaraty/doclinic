import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import '../../domain/repositories/appointment_repo.dart';
import '../data_sources/appointment_data_sources.dart';

class AppointmentRepoImpl implements AppointmentRepo{

  final AppointmentDataSources appointmentDataSources;

  AppointmentRepoImpl(this.appointmentDataSources);

  @override
  Future<Either<Failures, Unit>> bookAppointment(String doctorId, String startTime) async {
    return await appointmentDataSources.bookAppointment(doctorId, startTime);
  }
}