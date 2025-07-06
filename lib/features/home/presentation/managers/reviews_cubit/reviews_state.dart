part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsSuccess extends ReviewsState {
  final GetAllReviewsModel reviews;

  const ReviewsSuccess(this.reviews);

  @override
  List<Object> get props => [reviews];
}

class ReviewsFailure extends ReviewsState {
  final String errorMessage;

  const ReviewsFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ReviewsCreating extends ReviewsState {}

class ReviewsCreateSuccess extends ReviewsState {}

class ReviewsCreateFailure extends ReviewsState {
  final String errorMessage;

  const ReviewsCreateFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
