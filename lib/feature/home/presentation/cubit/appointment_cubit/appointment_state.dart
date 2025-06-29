part of 'appointment_cubit.dart';

sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentSuccess extends AppointmentState {}

final class AppointmentError extends AppointmentState {
  final String error;
  AppointmentError(this.error);
}
