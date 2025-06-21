
import 'package:doclinic/feature/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_prefs_keys.dart';
import '../../../domain/entites/auth_entity.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUsecase) : super(SignUpInitial());

  final SignUpUsecase signUpUsecase;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    emit(SignUpLoading());
    final result = await signUpUsecase.call(
      nameController.text,
      emailController.text,
      phoneController.text,
      '0',
      passwordController.text,
      confirmPasswordController.text,
    );
    result.fold((failure) => emit(SignUpError(failure.error)), (user) async {
      await SharedPrefHelper.setSecuredString(SharedPrefsKeys.tokenKey, user.data.token);
      emit(SignUpSuccess(user));
    });
    }
  }

