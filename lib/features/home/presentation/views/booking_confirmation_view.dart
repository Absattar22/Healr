import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/booking_confirmation_view_body.dart';

class BookingConfirmationView extends StatelessWidget {
  const BookingConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Datum?;
    return BookingConfirmationViewBody(
      data: data,
    );
  }
}
