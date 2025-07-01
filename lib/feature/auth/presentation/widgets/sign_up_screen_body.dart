import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/auth/presentation/widgets/sign_up_form.dart';
import 'package:doclinic/feature/auth/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/dio_factory.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';
import 'already_have_account_text.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: AppTextStyles.font24Bold(context),
              ),
              8.verticalSpace,
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: AppTextStyles.font14Regular(context).copyWith(
                    color: AppColors.grey
                ),
              ),
              36.verticalSpace,
              Column(
                children: [
                  const SignupForm(),
                  40.verticalSpace,
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpError) {
                        ToastHelper().showErrorToast(
                            context, state.error.toString());
                      } else if (state is SignUpSuccess) {
                        context.pushNamedAndRemoveUntil(
                        Routes.mainScreen,
                        predicate: (route) => false,
                        );
                        DioFactory.setTokenIntoHeaderAfterLogin(
                          state.authEntity.data.token,
                        );
                        ToastHelper().showSuccessToast(
                          context,
                          state.authEntity.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      if(state is SignUpLoading) {
                        return CustomButton(onPressed: (){} , isLoading: true, text: "Create Account",);
                      }
                        return CustomButton(
                        text: "Create Account",
                        textStyle: AppTextStyles
                            .font16SemiBold(context)
                            .copyWith(
                            color: AppColors.background, height: 2
                        ),
                        onPressed: () {
                          if (context.read<SignUpCubit>().formKey.currentState!.validate()){
                            context
                                .read<SignUpCubit>()
                                .signUp();
                          }

                        },
                      );
                    },
                  ),
                  16.verticalSpace,
                  const TermsAndConditionsText(),
                  30.verticalSpace,
                  const AlreadyHaveAccountText(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
