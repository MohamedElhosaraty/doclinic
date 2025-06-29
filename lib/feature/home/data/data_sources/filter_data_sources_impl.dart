import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/home/domain/entities/filter_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/filter_model.dart';
import 'filter_data_sources.dart';

class FilterDataSourcesImpl implements FilterDataSources{

  final ApiManager apiManager;

  FilterDataSourcesImpl(this.apiManager);
  @override
  Future<Either<Failures, FilterEntity>> getFilterData(int cityId) async{
    try{
      final response = await apiManager.get(endPoint: ApiConstants.filter(cityId));
      final data = FilterModel.fromJson(response.data);
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