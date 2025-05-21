import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/book2_header.dart';
import 'package:healr/features/home/presentation/views/widgets/details_statement.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:healr/features/home/presentation/views/widgets/icon_statement.dart';

class AppointDetailsViewBody extends StatelessWidget {
  const AppointDetailsViewBody({super.key, this.data});
  final Datum? data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: CustomButton(
          text: "Back to Home",
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.kHomeView,
            );
          },
          padding: 0,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Book2Header(title: "Appointment Details"),
            SizedBox(height: 24.h),
            DoctorInfo(data: data),
            SizedBox(
              height: 28.h,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffCCCCCC),
            ),
            SizedBox(height: 16.h),
            const DetailsStatement(
                label: "Date & hour", detail: "July 1st, 2025 | 01:00PM"),
            SizedBox(height: 16.h),
            const DetailsStatement(
                label: "Type", detail: "In Person Consultation"),
            SizedBox(height: 16.h),
            const DetailsStatement(label: "Booking for", detail: "Self"),
            SizedBox(height: 20.h),
            const Divider(
              thickness: 1,
              color: Color(0xffCCCCCC),
            ),
            SizedBox(height: 16.h),
            const DetailsStatement(label: "Amount", detail: "300 L.E."),
            SizedBox(height: 16.h),
            const DetailsStatement(
                label: "Health Insurance discount", detail: "- 40 L.E."),
            SizedBox(height: 20.h),
            const Divider(
              thickness: 1,
              color: Color(0xffCCCCCC),
            ),
            SizedBox(height: 16.h),
            const DetailsStatement(label: "Total", detail: "260 L.E."),
            SizedBox(height: 16.h),
            const Divider(
              thickness: 1,
              color: Color(0xffCCCCCC),
            ),
            SizedBox(height: 16.h),
            const IconStatement(
              icon: "assets/images/cash.svg",
              label: "Payment with Cash",
            ),
          ],
        ),
      )),
    ));
  }
}
