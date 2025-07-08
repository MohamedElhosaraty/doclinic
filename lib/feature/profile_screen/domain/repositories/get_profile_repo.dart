import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/get_profile_entity.dart';

abstract class GetProfileRepo {
  Future<Either<Failures, GetProfileEntity>> getProfile();
}