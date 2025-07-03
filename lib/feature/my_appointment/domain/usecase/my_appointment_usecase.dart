import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/my_appointment_entity.dart';
import '../repositories/my_appointment_repo.dart';

class MyAppointmentUseCase {
  final MyAppointmentRepo myAppointmentRepo;

  MyAppointmentUseCase(this.myAppointmentRepo);

  Future<Either<Failures, MyAppointmentEntity>> getMyAppointments() async => await myAppointmentRepo.getMyAppointments();
}