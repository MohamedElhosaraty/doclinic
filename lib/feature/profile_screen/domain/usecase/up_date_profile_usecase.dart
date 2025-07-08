import 'package:dartz/dartz.dart';
import 'package:doclinic/feature/profile_screen/domain/repositories/up_date_profile_repo.dart';

import '../../../../core/error/failures.dart';

class UpDateProfileUseCase {

  final UpDateProfileRepo upDataProfileRepo;

  UpDateProfileUseCase(this.upDataProfileRepo);

  Future<Either<Failures, Unit>> call(String name, String email, String phone,
      String gender) async {
    return await upDataProfileRepo.updateProfile(name, email, phone, gender);
  }
}