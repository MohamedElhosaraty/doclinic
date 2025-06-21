import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/auth_entity.dart';
import '../repositories/sign_up_repo.dart';

class SignUpUsecase {
  final SignUpRepo signUpRepo;

  SignUpUsecase(this.signUpRepo);

  Future<Either<Failures, AuthEntity>> call(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String confirmPassword,
  ) async {
    return await signUpRepo.signUp(
      name,
      email,
      phone,
      gender,
      password,
      confirmPassword,
    );
  }
}
