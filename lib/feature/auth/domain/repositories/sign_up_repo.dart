import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/auth_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failures, AuthEntity>> signUp(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String confirmPassword,
  );
}
