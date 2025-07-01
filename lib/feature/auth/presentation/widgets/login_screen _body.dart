import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/auth/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/api/dio_factory.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'dont_have_account_text.dart';
import 'email_and_password.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                ToastHelper().showErrorToast(context, state.message.toString());
              } else if (state is LoginSuccess) {
                context.pushNamedAndRemoveUntil(
                Routes.mainScreen,
                predicate: (route) => false,
                );
                DioFactory.setTokenIntoHeaderAfterLogin(
                  state.loginEntity.data.token,
                );
                ToastHelper().showSuccessToast(
                  context,
                  state.loginEntity.message,
                );
              }
            },
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Form(
                  key: context.read<LoginCubit>().formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: AppTextStyles.font24Bold(context),
                      ),
                      8.verticalSpace,
                      Text(
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                        style: AppTextStyles.font14Regular(
                          context,
                        ).copyWith(color: AppColors.grey),
                      ),
                      36.verticalSpace,
                      const EmailAndPassword(),
                      24.verticalSpace,
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(-15, 0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: context.read<LoginCubit>().isChecked,
                                  activeColor: AppColors.primaryColor,
                                  onChanged: (value) {
                                    context.read<LoginCubit>().changeCheckBox();
                                  },
                                ),
                                Text(
                                  "Remember me",
                                  style: AppTextStyles.font12Regular(
                                    context,
                                  ).copyWith(color: AppColors.grey),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Forgot Password?',
                            style: AppTextStyles.font13Regular(context),
                          ),
                        ],
                      ),
                      40.verticalSpace,
                      state is LoginLoading
                          ? CustomButton(
                            isLoading: true,
                            onPressed: () {},
                            text: "Log In",
                          )
                          : CustomButton(
                            text: "Login",
                            textStyle: AppTextStyles.font16SemiBold(
                              context,
                            ).copyWith(color: AppColors.background, height: 2),
                            onPressed: () {
                              if (context.read<LoginCubit>().formKey.currentState!
                                  .validate()) {
                                context.read<LoginCubit>().login();
                              }
                            },
                          ),
                      20.verticalSpace,
                      const TermsAndConditionsText(),
                      30.verticalSpace,
                      const DontHaveAccountText(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
