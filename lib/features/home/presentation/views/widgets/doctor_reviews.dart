import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/home/data/models/get_all_reviews_model/user_review.dart';
import 'package:healr/features/home/presentation/managers/reviews_cubit/reviews_cubit.dart';
import 'package:healr/features/home/presentation/views/widgets/review_card.dart';

class DoctorReviews extends StatefulWidget {
  final UserReview? review;
  const DoctorReviews({super.key, required this.review});

  @override
  State<DoctorReviews> createState() => _DoctorReviewsState();
}

class _DoctorReviewsState extends State<DoctorReviews> {
  @override
  void initState() {
    BlocProvider.of<ReviewsCubit>(context).getAllReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        const Divider(
          thickness: 1,
          color: Color(0xffCCCCCC),
        ),
        SizedBox(
          height: 4.h,
        ),
        BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            if (state is ReviewsLoading) {
              return Center(
                  child: Column(
                children: [
                  SizedBox(height: 32.h),
                  CircularProgressIndicator(
                    color: kSecondaryColor,
                  ),
                  SizedBox(height: 32.h),
                ],
              ));
            } else if (state is ReviewsSuccess) {
              if (state.reviews.data != null &&
                  state.reviews.data!.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.reviews.data!.length,
                  itemBuilder: (context, index) {
                    return ReviewCard(review: state.reviews.data![index]);
                  },
                );
              } else {
                return const Text("No reviews available");
              }
            } else if (state is ReviewsFailure) {
              return Text(state.errorMessage);
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
