import 'package:dartz/dartz.dart';
import 'package:doclinic/feature/my_appointment/domain/entities/my_appointment_entity.dart';

import '../../../../core/error/failures.dart';

abstract class MyAppointmentDataSources {
  Future <Either<Failures, MyAppointmentEntity>> getMyAppointments();
}