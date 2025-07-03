import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/my_appointment/domain/entities/my_appointment_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/my_appointment_model.dart';
import 'my_appointment_data_sources.dart';

class MyAppointmentDataSourcesImpl implements MyAppointmentDataSources {

  final ApiManager apiManager;

  MyAppointmentDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, MyAppointmentEntity>> getMyAppointments() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.myAppointments);
      final data = MyAppointmentModel.fromJson(response.data);
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