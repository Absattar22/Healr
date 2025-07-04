import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/home/data/models/get_all_reviews_model/get_all_reviews_model.dart';
import 'package:healr/features/home/data/repos/reviews_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsRepoImp implements ReviewsRepo {
  final ApiService apiService;
  ReviewsRepoImp(this.apiService);
  @override
  Future<Either<Failure, GetAllReviewsModel>> getReviews() async {
    try {
      final response = await apiService.get(
        endPoint: 'review/getAllReviews',
      );

      if (response.containsKey('status') && response['status'] == 'error') {
        return Left(ServerFailure(response['message']));
      }

      final user = GetAllReviewsModel.fromJson(response);
      return Right(user);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('⚠️ Unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createReview(
      String review, int rating) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final response = await apiService.post(
        endPoint: 'review/createReview/685ad71681a332de9165e748',
        body: {
          'reviewText': review,
          'rating': rating,
        },
        token: token.isNotEmpty ? 'Bearer $token' : '',
      );

      if (response.containsKey('status') && response['status'] == 'error') {
        return Left(ServerFailure(response['message']));
      }

      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('⚠️ Unexpected error occurred: $e'));
    }
  }
}
