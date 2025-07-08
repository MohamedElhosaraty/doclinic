part of 'up_date_personal_information_cubit.dart';

sealed class UpDatePersonalInformationState {}

final class UpDatePersonalInformationInitial
    extends UpDatePersonalInformationState {}

final class UpDatePersonalInformationLoading
    extends UpDatePersonalInformationState {}

final class UpDatePersonalInformationSuccess
    extends UpDatePersonalInformationState {}

final class UpDatePersonalInformationError
    extends UpDatePersonalInformationState {
  final String error;
  UpDatePersonalInformationError(this.error);
}
