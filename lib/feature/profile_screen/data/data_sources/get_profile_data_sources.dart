import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/get_profile_entity.dart';

abstract class GetProfileDataSources {
  Future<Either<Failures, GetProfileEntity>> getProfile();
}