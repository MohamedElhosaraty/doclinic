import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/profile_screen/domain/entities/get_profile_entity.dart';

import '../../domain/repositories/get_profile_repo.dart';
import '../data_sources/get_profile_data_sources.dart';

class GetProfileRepoImpl implements GetProfileRepo{

  final GetProfileDataSources getProfileDataSources;
  GetProfileRepoImpl( this.getProfileDataSources);
  @override
  Future<Either<Failures, GetProfileEntity>> getProfile() async{
    return await getProfileDataSources.getProfile();
  }
}