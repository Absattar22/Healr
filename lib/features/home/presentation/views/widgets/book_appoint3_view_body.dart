import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/managers/selected_day/selected_day_cubit.dart';
import 'package:healr/features/home/presentation/views/widgets/appoint_day_item.dart';
import 'package:healr/features/home/presentation/views/widgets/appoint_time_item.dart';
import 'package:healr/features/home/presentation/views/widgets/book2_header.dart';
import 'package:healr/features/home/presentation/views/widgets/choose_appoint_day.dart';
import 'package:healr/features/home/presentation/views/widgets/choose_appoint_time.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_stats.dart';

class BookAppoint3ViewBody extends StatelessWidget {
  const BookAppoint3ViewBody({super.key, this.data});
  final Datum? data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: CustomButton(
          text: "Book appointment",
          onPressed: () {},
          padding: 0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Book2Header(
                title: "Book appointment",
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
              DoctorStats(data: data),
              SizedBox(height: 16.h),
              Text(
                "Book Appointment",
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(height: 16.h),
              const ChooseAppointDay(),
              SizedBox(
                height: 16.h,
              ),
              const ChooseAppointTime(),
            ],
          ),
        ),
      ),
    ));
  }
}
