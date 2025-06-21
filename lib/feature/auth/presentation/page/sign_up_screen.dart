import 'package:doclinic/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/sign_up_screen_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  getIt<SignUpCubit>(),
      child: Scaffold(
        body: SignUpScreenBody(),
      ),
    );
  }

}