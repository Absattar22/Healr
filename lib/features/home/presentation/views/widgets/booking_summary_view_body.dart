import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/book2_header.dart';
import 'package:healr/features/home/presentation/views/widgets/details_statement.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:healr/features/home/presentation/views/widgets/icon_statement.dart';

class BookingSummaryViewBody extends StatelessWidget {
  const BookingSummaryViewBody({super.key, this.data});
  final Datum? data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              text: "Confirm Booking",
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kBookingConfirmationView,
                  extra: data,
                );
              },
              padding: 0,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
                "You will receive a reminder 24 hours prior to your appointment.",
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff666666),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Book2Header(title: "Review Summary"),
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
