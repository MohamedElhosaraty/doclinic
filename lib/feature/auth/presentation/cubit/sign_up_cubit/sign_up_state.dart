part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final AuthEntity authEntity;
  SignUpSuccess(this.authEntity);
}

final class SignUpError extends SignUpState {
  final String error;
  SignUpError(this.error);
}
