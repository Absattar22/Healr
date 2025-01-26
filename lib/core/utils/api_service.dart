import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    var response = await _dio.post(url, data: data);
    return response.data;
  }
}
