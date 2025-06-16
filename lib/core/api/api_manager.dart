import 'package:dio/dio.dart';

class ApiManager {
  ApiManager({required this.dio});

  final Dio dio;
  static const String baseUrl = 'https://vcare.integration25.com/api/';

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(
      baseUrl + endPoint,
      data: data,
    );

    return response;
  }

  Future<Response> get({required String endPoint}) async {
    final response = await dio.get(
      baseUrl + endPoint,
    );

    return response;
  }

  Future<Response> delete({required String endPoint,required Map<String, dynamic> data,}) async {
    final response = await dio.delete(
      baseUrl + endPoint,
      data: data,

    );

    return response;
  }

  Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.patch(
      baseUrl + endPoint,
      data: data,
    );

    return response;
  }
}
