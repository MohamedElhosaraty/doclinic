import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/get_profile_entity.dart';
import '../repositories/get_profile_repo.dart';

class GetProfileUseCase {
  final GetProfileRepo profileRepo;

  GetProfileUseCase(this.profileRepo);

  Future<Either<Failures, GetProfileEntity>> call() async {
    return await profileRepo.getProfile();
  }
}