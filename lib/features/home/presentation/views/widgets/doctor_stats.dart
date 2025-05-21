import 'package:flutter/material.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_stat_item.dart';

class DoctorStats extends StatelessWidget {
  const DoctorStats({super.key, this.data});
  final Datum? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const DoctorStatsItem(
          icon: "assets/images/persons.svg",
          count: "1,200+",
          label: "Patients",
        ),
        DoctorStatsItem(
          icon: "assets/images/experince.svg",
          count: data?.exp.toString() ?? "2",
          label: "Years Exp.",
        ),
        DoctorStatsItem(
          icon: "assets/images/rate.svg",
          count: data?.rate.toString() ?? "1",
          label: "Rating",
        ),
        const DoctorStatsItem(
          icon: "assets/images/reviews.svg",
          count: "421",
          label: "Review",
        ),
      ],
    );
  }
}
