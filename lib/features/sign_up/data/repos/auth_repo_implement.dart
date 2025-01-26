import 'package:dartz/dartz.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/auth/sign_up/data/repos/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  final baseUrl = 'healer-theta.vercel.app/api/v1/';
  final ApiService _apiService;
  AuthRepoImplement(this._apiService);
  @override
  Future<Either<String, Map<String, dynamic>>> creatAnAccount(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await _apiService.post('${baseUrl}signUp', data);
      return right(response);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
