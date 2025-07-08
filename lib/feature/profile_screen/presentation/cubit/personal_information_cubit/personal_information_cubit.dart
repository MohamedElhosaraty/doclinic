
import 'package:doclinic/feature/profile_screen/domain/entities/get_profile_entity.dart';
import 'package:doclinic/feature/profile_screen/domain/usecase/get_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_information_state.dart';

class PersonalInformationCubit extends Cubit<PersonalInformationState> {
  PersonalInformationCubit(this.getProfileUsecase) : super(PersonalInformationInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GetProfileUseCase getProfileUsecase;
  String name = "";

  Future<void> getProfile() async {
    emit(PersonalInformationLoading());
    final result = await getProfileUsecase.call();
    result.fold(
      (failure) => emit(PersonalInformationError(failure.error)),
      (user) {
        nameController.text = user.name;
        emailController.text = user.email;
        phoneController.text = user.phone;
        name = user.name;
        emit(PersonalInformationSuccess(getProfileEntity: user));
      },
    );
  }
}
