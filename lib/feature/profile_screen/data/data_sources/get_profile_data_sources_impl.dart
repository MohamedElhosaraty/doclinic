import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doclinic/core/error/failures.dart';
import 'package:doclinic/feature/profile_screen/data/data_sources/get_profile_data_sources.dart';
import 'package:doclinic/feature/profile_screen/domain/entities/get_profile_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/get_profile_model.dart';

class GetProfileDataSourcesImpl implements GetProfileDataSources {

  final ApiManager apiManager;
  GetProfileDataSourcesImpl(this.apiManager);
  @override
  Future<Either<Failures, GetProfileEntity>> getProfile() async {
    try{
      final response = await apiManager.get(endPoint: ApiConstants.getProfile);
      final data = GetProfileModel.fromJson(response.data["data"][0]);
      return Right(data);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}