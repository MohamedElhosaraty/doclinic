import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doclinic/core/error/failures.dart';
import 'package:doclinic/feature/profile_screen/data/data_sources/up_date_profile_data_sources.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';

class UpDateProfileDataSourcesImpl implements UpDateProfileDataSources {
  final ApiManager apiManager;

  UpDateProfileDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, Unit>> updateProfile(
    String name,
    String email,
    String phone,
    String gender,
  ) async {
    try {
     await apiManager.post(
        endPoint: ApiConstants.updateProfile,
        data: {"name": name, "email": email, "phone": phone, "gender": gender},
      );
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
