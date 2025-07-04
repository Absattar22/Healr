import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/features/home/data/models/get_all_reviews_model/get_all_reviews_model.dart';

abstract class ReviewsRepo {
  Future<Either<Failure, GetAllReviewsModel>> getReviews();
  Future<Either<Failure, dynamic>> createReview(String review, int rating);
}
