import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../../core/helpers/shared_prefs_keys.dart';
import '../../../domain/entites/auth_entity.dart';
import '../../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  final LoginUsecase loginUsecase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;

  void changeCheckBox() {
    isChecked = !isChecked;
    emit(LoginForgetPassword());
  }

  Future<void> login() async {
    emit(LoginLoading());
    final result = await loginUsecase.call(
      emailController.text,
      passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginError(failure.error)),
      (user) async {
        if (isChecked) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefsKeys.tokenKey,
            user.data.token,
          );
        }
        emit(
          LoginSuccess(user),
        );
      },
    );
  }
}
