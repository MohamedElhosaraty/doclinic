import 'package:doclinic/feature/profile_screen/presentation/widget/custom_personal_information_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/personal_information_cubit/personal_information_cubit.dart';
import 'custom_personal_information_body.dart';

class CustomPersonalInformationBuilder extends StatelessWidget {
  const CustomPersonalInformationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInformationCubit, PersonalInformationState>(
      builder: (context, state) {
        if (state is PersonalInformationLoading) {
          return const CustomPersonalInformationLoading();
        } else if (state is PersonalInformationError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is PersonalInformationSuccess) {
          return CustomPersonalInformationBody();
        }
        return SizedBox.shrink();
      },
    );
  }
}
