import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class UpDateProfileDataSources {
  Future<Either<Failures, Unit>> updateProfile(String name, String email, String phone, String gender);
}