import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/login/data/model/forget_pass_model.dart';
import 'package:healr/features/login/data/repos/forget_pass_repo.dart';

class ForgetPassRepoImp implements ForgetPassRepo {
  final ApiService apiService;

  ForgetPassRepoImp(this.apiService);

  @override
  Future<Either<Failure, ForgetPassModel>> forgetpass(String email) async {
    try {
      final response = await apiService.post(
        endPoint: 'forgotPassword',
        body: {
          'email': email,
        },
      );

      if (response.containsKey('status') && response['status'] == 'error') {
        return Left(ServerFailure(response['message']));
      }

      final user = ForgetPassModel.fromJson(response);
      return Right(user);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('⚠️ Unexpected error occurred: $e'));
    }
  }
}
