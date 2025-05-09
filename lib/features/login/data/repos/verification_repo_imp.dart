import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/login/data/model/forget_pass_model.dart';
import 'package:healr/features/login/data/repos/verification_repo.dart';

class VerificationRepoImp implements VerificationRepo {
  final ApiService apiService;

  VerificationRepoImp(this.apiService);

  @override
  Future<Either<Failure, ForgetPassModel>> verification(String code) async {
    try {
      final response = await apiService.post(
        endPoint: 'resetPassword',
        body: {
          'verificationCode': code,
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
