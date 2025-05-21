import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/book2_header.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_stats.dart';
import 'package:healr/features/home/presentation/views/widgets/working_hours.dart';

class DoctorProfileViewBody extends StatelessWidget {
  const DoctorProfileViewBody({super.key, this.data});
  final Datum? data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Book2Header(
                  title: "Our Doctors",
                ),
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
                DoctorStats(
                  data: data,
                ),
                SizedBox(height: 16.h),
                Text(
                  "About Doctor:",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Consequat tristique diam elementum praesent nisi mollis non. Ante vitae dapibus tellus scelerisque laoreet volutpat urna diam. ",
                  style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff666666)),
                ),
                SizedBox(height: 16.h),
                const WorkingHours(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
