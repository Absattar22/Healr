import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/data/models/appoint_details_model/appoint_details_model.dart';
import 'package:healr/features/home/presentation/views/widgets/book2_header.dart';
import 'package:healr/features/home/presentation/views/widgets/details_statement.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:healr/features/home/presentation/views/widgets/icon_statement.dart';

class AppointDetailsViewBody extends StatelessWidget {
  const AppointDetailsViewBody({super.key, this.data, this.appointDetails});
  final Datum? data;
  final AppointDetailsModel? appointDetails;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: CustomButton(
          text: "Back to Home",
          onPressed: () {
            GoRouter.of(context).pushReplacement(
              AppRouter.kHomeView,
              extra: {
                'data': data,
                'appointDetails': appointDetails,
              },
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
            DetailsStatement(
                label: "Appointment ID",
                detail: "${appointDetails!.data!.appointment!.id}"),
            SizedBox(height: 16.h),
            DetailsStatement(
                label: "Date & hour",
                detail:
                    "${appointDetails!.data!.appointment!.day}, 2025 | ${appointDetails!.data!.appointment!.time}"),
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
            DetailsStatement(
                label: "Amount", detail: "${data?.price ?? "300"} L.E."),
            SizedBox(height: 16.h),
            const DetailsStatement(
                label: "Health Insurance discount", detail: "- 40 L.E."),
            SizedBox(height: 20.h),
            const Divider(
              thickness: 1,
              color: Color(0xffCCCCCC),
            ),
            SizedBox(height: 16.h),
            DetailsStatement(
                label: "Total", detail: "${(data?.price ?? 300) - 40} L.E."),
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
