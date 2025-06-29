import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:doclinic/core/error/failures.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import 'appointment_data_sources.dart';

class AppointmentDataSourcesImpl implements AppointmentDataSources {
  final ApiManager apiManager;

  AppointmentDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, Unit>> bookAppointment(
    String doctorId,
    String startTime,
  ) async {
    try {
      await apiManager.post(
        endPoint: ApiConstants.bookAppointment,
        data: {"doctor_id": doctorId, "start_time": startTime},
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
