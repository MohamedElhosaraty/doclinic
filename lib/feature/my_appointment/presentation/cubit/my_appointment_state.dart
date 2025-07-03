part of 'my_appointment_cubit.dart';

sealed class MyAppointmentState {}

final class MyAppointmentInitial extends MyAppointmentState {}

final class MyAppointmentLoading extends MyAppointmentState {}

final class MyAppointmentSuccess extends MyAppointmentState {
  final List<DataEntity> allMyAppointments;
  final List<DataEntity> doneMyAppointments;
  final List<DataEntity> canceledMyAppointments;

  MyAppointmentSuccess({
    required this.allMyAppointments,
    required this.doneMyAppointments,
    required this.canceledMyAppointments,
  });
}

final class MyAppointmentError extends MyAppointmentState {
  final String error;

  MyAppointmentError({required this.error});
}
