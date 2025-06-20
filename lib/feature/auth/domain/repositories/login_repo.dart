import 'package:dartz/dartz.dart';
import 'package:doclinic/core/error/failures.dart';

import '../entites/auth_entity.dart';

abstract class LoginRepo {
  Future<Either<Failures, AuthEntity>> login(String email, String password);
}