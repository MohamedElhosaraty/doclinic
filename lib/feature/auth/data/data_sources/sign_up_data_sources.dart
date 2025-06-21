import '../../../../core/error/failures.dart';
import '../../domain/entites/auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, AuthEntity>> signUp(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String confirmPassword,
  );
}
