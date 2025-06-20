import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/booking_summary_view_body.dart';

class BookingSummaryView extends StatelessWidget {
  const BookingSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Datum?;
    return BookingSummaryViewBody(
      data: data,
    );
  }
}
