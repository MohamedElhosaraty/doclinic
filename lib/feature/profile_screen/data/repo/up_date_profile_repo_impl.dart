import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import '../../domain/repositories/up_date_profile_repo.dart';
import '../data_sources/up_date_profile_data_sources.dart';

class UpDateProfileRepoImpl implements UpDateProfileRepo{

  final UpDateProfileDataSources upDateDataSources;
  UpDateProfileRepoImpl(this.upDateDataSources);

  @override
  Future<Either<Failures, Unit>> updateProfile(String name, String email, String phone, String gender) async {
    return await upDateDataSources.updateProfile(name, email, phone, gender);
  }
}