import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healr/features/home/data/models/get_all_reviews_model/get_all_reviews_model.dart';
import 'package:healr/features/home/data/repos/reviews_repo.dart';
part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.reviewsRepo) : super(ReviewsInitial());
  final ReviewsRepo reviewsRepo;

  Future<void> getAllReviews() async {
    emit(ReviewsLoading());
    var result = await reviewsRepo.getReviews();
    result.fold(
      (failure) => emit(ReviewsFailure(failure.errMessage)),
      (reviews) => emit(ReviewsSuccess(reviews)),
    );
  }

  Future<void> createReview(String review, int rating) async {
    emit(ReviewsCreating());
    var result = await reviewsRepo.createReview(review, rating);
    result.fold(
      (failure) => emit(ReviewsCreateFailure(failure.errMessage)),
      (success) {
        emit(ReviewsCreateSuccess());
        getAllReviews();
      },
    );
  }
}
