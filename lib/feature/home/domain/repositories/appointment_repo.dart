import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class AppointmentRepo {
  Future<Either<Failures, Unit>> bookAppointment(String doctorId ,String startTime);
}