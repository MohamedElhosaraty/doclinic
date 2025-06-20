import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entites/auth_entity.dart';
import '../repositories/login_repo.dart';

class LoginUsecase {

  final LoginRepo loginRepo;

  LoginUsecase(this.loginRepo);

  Future<Either<Failures, AuthEntity>> call(String email, String password) async {
    return await loginRepo.login(email, password);
  }
}