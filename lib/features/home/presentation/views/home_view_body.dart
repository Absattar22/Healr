import 'package:flutter/material.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/data/models/appoint_details_model/appoint_details_model.dart';
import 'package:healr/features/home/presentation/views/widgets/bottom_nav_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, this.data, this.appointDetails});

  final Datum? data;
  final AppointDetailsModel? appointDetails;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomNavBar(
        data: widget.data,
        appointDetails: widget.appointDetails,
      ),
    );
  }
}
