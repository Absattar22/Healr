import 'package:dartz/dartz.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/sign_up/data/repos/signup_repo.dart';

class SignUpRepoImplement implements SignUpRepo {
  final baseUrl = 'healer-theta.vercel.app/api/v1/';
  final ApiService _apiService;
  SignUpRepoImplement(this._apiService);
  @override
  Future<Either<String, Map<String, dynamic>>> signUp(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await _apiService.post('${baseUrl}signUp', data);
      return right(response);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
