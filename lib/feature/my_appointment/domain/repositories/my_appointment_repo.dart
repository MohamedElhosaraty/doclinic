import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/my_appointment_entity.dart';

abstract class MyAppointmentRepo {
  Future<Either<Failures, MyAppointmentEntity>> getMyAppointments();
}