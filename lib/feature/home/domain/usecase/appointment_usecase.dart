import 'package:dartz/dartz.dart';
import 'package:doclinic/feature/home/domain/repositories/appointment_repo.dart';

import '../../../../core/error/failures.dart';

class AppointmentUsecase {

  final AppointmentRepo appointmentRepo;

  AppointmentUsecase(this.appointmentRepo);

  Future<Either<Failures, Unit>> call( String doctorId,String startTime) async => await appointmentRepo.bookAppointment(doctorId ,startTime);
}