import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doclinic/core/error/failures.dart';
import 'package:doclinic/feature/auth/data/data_sources/sign_up_data_sources.dart';
import 'package:doclinic/feature/auth/domain/entites/auth_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/auth_model.dart';

class SignUpDataSourcesImpl implements SignUpDataSources {
  final ApiManager apiManager;

  SignUpDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, AuthEntity>> signUp(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await apiManager.post(
        endPoint: ApiConstants.signUp,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "gender": gender,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      final data = AuthModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
