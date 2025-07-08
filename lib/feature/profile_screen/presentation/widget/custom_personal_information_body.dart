import 'package:doclinic/core/widgets/custom_button.dart';
import 'package:doclinic/core/widgets/custom_text_field.dart';
import 'package:doclinic/feature/profile_screen/presentation/cubit/up_date_personal_information_cubit/up_date_personal_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../cubit/personal_information_cubit/personal_information_cubit.dart';

class CustomPersonalInformationBody extends StatelessWidget {
  const CustomPersonalInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<PersonalInformationCubit>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextField(
            textController:
                context.read<PersonalInformationCubit>().nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },

            style: AppTextStyles.font14Medium(
              context,
            ).copyWith(color: AppColors.dartBlue),
          ),
          16.verticalSpace,
          CustomTextField(
            textController:
                context.read<PersonalInformationCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },

            style: AppTextStyles.font14Medium(
              context,
            ).copyWith(color: AppColors.dartBlue),
          ),
          16.verticalSpace,
          IntlPhoneField(
            controller:
                context.read<PersonalInformationCubit>().phoneController,
            onSaved: (value) {},
            flagsButtonPadding: EdgeInsets.only(left: 12.w),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 1, color: AppColors.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppColors.lightGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppColors.lightGrey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            initialCountryCode: 'EG',
            disableLengthCheck: true,
            dropdownIconPosition: IconPosition.trailing,
          ),
          24.verticalSpace,
          Text(
            "When you set up your personal information settings, you should take care to provide accurate information.",
            style: AppTextStyles.font14Regular(
              context,
            ).copyWith(color: AppColors.grey),
          ),
          70.verticalSpace,
          BlocListener<
            UpDatePersonalInformationCubit,
            UpDatePersonalInformationState>(
            listener: (context, state) {
              if (state is UpDatePersonalInformationSuccess) {
                ToastHelper().showSuccessToast(
                    context, 'Personal Information Updated Successfully');
                context.read<PersonalInformationCubit>().getProfile();
              }else if (state is UpDatePersonalInformationError) {
                ToastHelper().showErrorToast(
                    context, state.error.toString());
              }
            },
            child: CustomButton(
              yPadding: 15.h,
              onPressed: () {
                if (context
                    .read<PersonalInformationCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<UpDatePersonalInformationCubit>().upDateProfile(
                    context
                        .read<PersonalInformationCubit>()
                        .nameController
                        .text,
                    context
                        .read<PersonalInformationCubit>()
                        .emailController
                        .text,
                    context
                        .read<PersonalInformationCubit>()
                        .phoneController
                        .text,
                    '0',
                  );
                }
              },
              child: Text(
                "Save",
                style: AppTextStyles.font16SemiBold(
                  context,
                ).copyWith(color: AppColors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
