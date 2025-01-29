import 'package:dio/dio.dart';
import 'package:healr/core/errors/failure.dart';

class ApiService {
  final String baseUrl = 'https://healer-theta.vercel.app/api/v1/';
  final Dio dio;

  ApiService(this.dio) {
    dio.options.validateStatus = (status) => true;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      var response = await dio.post(
        '$baseUrl$endPoint',
        data: body,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.data is Map<String, dynamic>) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data;
        } else {
          throw ServerFailure.fromResponse(response.statusCode!, response.data);
        }
      } else {
        throw ServerFailure('⚠️ Invalid response format from the server.');
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {
      throw ServerFailure(' $e');
    }
  }
}
