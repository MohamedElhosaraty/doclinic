
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/appointment_usecase.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this.appointmentUseCase) : super(AppointmentInitial());

  final AppointmentUsecase appointmentUseCase;

  Future<void> bookAppointment( String doctorId,String startTime) async {
    emit(AppointmentLoading());
    final result = await appointmentUseCase.call( doctorId,startTime);
    result.fold((failure) => emit(AppointmentError(failure.error)), (r) => emit(AppointmentSuccess()));
  }
}
