import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/login/data/model/user_model.dart';
import 'package:healr/features/login/data/repos/login_repo.dart';

class LoginRepoImp implements LoginRepo {
  final ApiService apiService;

  LoginRepoImp(this.apiService);

  @override
  Future<Either<Failure, UserModel>> loginUser(
      String nationalID, String password) async {
    try {
      final response = await apiService.post(
        endPoint: 'loginWithId',
        body: {
          'nationalID': nationalID,
          'password': password,
        },
      );


      if (response.containsKey('status') && response['status'] == 'error') {
        return Left(ServerFailure(response['message']));
      }

      final user = UserModel.fromJson(response);
      return Right(user);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('⚠️ Unexpected error occurred: $e')); // هنا نضيف التفاصيل الحقيقية للخطأ
    }
  }
}
