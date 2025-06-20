import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entites/auth_entity.dart';

abstract class LoginDataSources {
  Future<Either<Failures, AuthEntity>> login(String email, String password);
}
