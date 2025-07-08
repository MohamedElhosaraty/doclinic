part of 'personal_information_cubit.dart';

sealed class PersonalInformationState {}

final class PersonalInformationInitial extends PersonalInformationState {}

final class PersonalInformationLoading extends PersonalInformationState {}

final class PersonalInformationSuccess extends PersonalInformationState {

  final GetProfileEntity getProfileEntity;

  PersonalInformationSuccess({required this.getProfileEntity});
}

final class PersonalInformationError extends PersonalInformationState {
  final String message;

  PersonalInformationError(this.message);
}
