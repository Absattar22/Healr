import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/appoint_details_view_body.dart';

class AppointDetailsView extends StatelessWidget {
  const AppointDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Datum?;
    return AppointDetailsViewBody(
      data: data,
    );
  }
}
