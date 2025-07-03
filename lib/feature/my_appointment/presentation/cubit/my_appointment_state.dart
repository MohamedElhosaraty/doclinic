part of 'my_appointment_cubit.dart';

sealed class MyAppointmentState {}

final class MyAppointmentInitial extends MyAppointmentState {}

final class MyAppointmentLoading extends MyAppointmentState {}

final class MyAppointmentSuccess extends MyAppointmentState {}

final class MyAppointmentError extends MyAppointmentState {
  final String error;
  MyAppointmentError({required this.error});
}
