import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doclinic/core/api/api_manager.dart';

import 'package:doclinic/core/error/failures.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../domain/entites/auth_entity.dart';
import '../model/auth_model.dart';
import 'login_data_sources.dart';

class LoginDataSourcesImpl implements LoginDataSources{

  final ApiManager apiManager;

  LoginDataSourcesImpl(this.apiManager);
  @override
  Future<Either<Failures, AuthEntity>> login(String email, String password) async{
    try{
      final response = await apiManager.post(endPoint:  ApiConstants.login, data: {"email": email, "password": password});
      final data = AuthModel.fromJson(response.data);
      return Right(data);
    }catch(e){
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}