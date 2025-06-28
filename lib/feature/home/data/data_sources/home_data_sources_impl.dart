import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/home/domain/entities/home_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/home_model.dart';
import 'home_data_sources.dart';

class HomeDataSourcesImpl implements HomeDataSources{

  final ApiManager apiManager;

  HomeDataSourcesImpl(this.apiManager);
  @override
  Future<Either<Failures, HomeEntity>> getHomeData() async{
    try{
      final response = await apiManager.get(endPoint: ApiConstants.home);
      final data = HomeModel.fromJson(response.data);
      return Right(data);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
  }else{
        return Left(ServerFailure( error: e.toString()));
      }
    }
  }
}